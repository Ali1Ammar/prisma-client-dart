// PrismaVersion is a hardcoded version of the Prisma CLI.
import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:prisma_dart/helper/cahce_dir.dart';
import 'package:prisma_dart/helper/chmod.dart';
import 'package:prisma_dart/src/binaries/platform/platform.dart';

const prismaVersion = "3.13.0";

// EngineVersion is a hardcoded version of the Prisma Engine.
// The versions can be found under https://github.com/prisma/prisma-engines/commits/master
const engineVersion = "efdf9b1183dddfd4258cd181a72125755215ab7b";

// PrismaURL points to an S3 bucket URL where the CLI binaries are stored.
var prismaURL =
    "https://prisma-photongo.s3-eu-west-1.amazonaws.com/%s-%s-%s.gz"; //TODO
String prismaURLBuilder(String name, String version, String platform) =>
    "https://prisma-photongo.s3-eu-west-1.amazonaws.com/$name-$version-$platform.gz";

// EngineURL points to an S3 bucket URL where the Prisma engines are stored.
var engineURL = "https://binaries.prisma.sh/all_commits/%s/%s/%s.gz";
String engineURLBuilder(String version, String platform, String name) =>
    "https://binaries.prisma.sh/all_commits/$version/$platform/$name.gz";

class Engine {
  final String name;
  final String env;

  const Engine(this.name, this.env);
  static const engines = [
    Engine(
      "query-engine",
      "PRISMA_QUERY_ENGINE_BINARY",
    ),
    Engine(
      "migration-engine",
      "PRISMA_MIGRATION_ENGINE_BINARY",
    ),
    Engine(
      "introspection-engine",
      "PRISMA_INTROSPECTION_ENGINE_BINARY",
    ),
    Engine(
      "prisma-fmt",
      "PRISMA_FMT_BINARY",
    ),
  ];
}

init() {
  final prismaURLEnv = Platform.environment["PRISMA_CLI_URL"];
  if (prismaURLEnv != null) {
    prismaURL = prismaURLEnv;
  }
  final engineURLEnv = Platform.environment["PRISMA_ENGINE_URL"];
  if (engineURLEnv != null) {
    engineURL = engineURLEnv;
  }
}

String prismaCLIName() {
  final variation = Platform.operatingSystem;
  return "prisma-cli-$variation";
}

var baseDirName = join("prisma", "binaries");

String globalTempDir(String version) {
  return join(Directory.systemTemp.path, baseDirName, "engines", version);
}

String globalUnpackDir(String version) {
  return join(globalTempDir(version), "unpacked", "v2");
}

String globalCacheDir() {
  final cache = userCacheDir();
  return join(cache, baseDirName, "cli", prismaVersion);
}

void fetchEngine(String toDir, String engineName, String binaryPlatformName) {
  final path = join(toDir, "prisma-$engineName-$binaryPlatformName");
  final to = checkForExtension(binaryPlatformName, path);
  final binaryPlatformRemoteName =
      binaryPlatformName == "linux" ? "linux-musl" : binaryPlatformName;

  final url = checkForExtension(binaryPlatformName,
      engineURLBuilder(engineVersion, binaryPlatformRemoteName, engineName));
  final file = File(to);
  if (file.existsSync()) return; //TODO cahced
  // print("Downloading $url");
  download(url, to);
}

Future<void> fetchNative(String toDir) async {
  final dir = File(toDir);
  if (!dir.isAbsolute) throw Exception("Path must be absolute");
  await downloadCLI(toDir);
  for (var element in Engine.engines) {
    downloadEngine(element.name, toDir);
  }
}

Future<void> downloadCLI(String toDir) async {
  final cli = prismaCLIName();
  final to = checkForExtension(Platform.operatingSystem, join(toDir, cli));
  final url = checkForExtension(Platform.operatingSystem,
      prismaURLBuilder("prisma-cli", prismaVersion, Platform.operatingSystem));
  print(to);
  if (!File(to).existsSync()) {
    print(
        "prisma cli doesn't exist, fetching... (this might take a few minutes)");
    await download(url, to);
  } else {
    print("prisma cli is cached");
  }
}

String getEnginePath(String dir, String engine, String binaryName) {
  return checkForExtension(
      binaryName, join(dir, engineVersion, "prisma-$engine-$binaryName"));
}

Future<String> downloadEngine(String name, String toDir) async {
  final binaryName = binaryPlatformName();
  final to = checkForExtension(
      binaryName, join(toDir, engineVersion, "prisma-$name-$binaryName"));
  final url = checkForExtension(
      binaryName, engineURLBuilder(engineVersion, binaryName, name));
  if (File(to).existsSync()) {
    // print("$to is cached");
    return to;
  }

  // print("Downloading $url");
  final startDownload = DateTime.now();
  await download(url, to);
  print("download() took ${DateTime.now().difference(startDownload)} ");
  return to;
}

Future<void> download(String url, String to) async {
  Directory(to.substring(0, to.lastIndexOf("/"))).createSync(recursive: true);

  final resp = await get(Uri.parse(url));
  if (resp.statusCode != 200) {
    throw Exception("received code ${resp.statusCode} from $url: ${resp.body}");
  }
   final afterGzip = GZipCodec().decode(resp.bodyBytes);
  final temp = File("$to.tmp");
  temp.writeAsBytesSync(afterGzip);
  await temp.copy(to);
  await makeExecutable(to);
}
