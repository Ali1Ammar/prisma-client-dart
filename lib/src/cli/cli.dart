import 'dart:io';

import 'package:path/path.dart';
import 'package:prisma_dart/helper/cahce_dir.dart';
import 'package:prisma_dart/src/binaries/binaries.dart';
import 'package:prisma_dart/src/binaries/platform/platform.dart';

Future<void> runCli(List<String> args, bool output) async {
  print("running cli with args $args");
  final dir = globalCacheDir();
  await fetchNative(dir);
  final prisma = prismaCLIName();
  final env = <String, String>{
    "PRISMA_HIDE_UPDATE_MESSAGE":"true",
    "PRISMA_CLI_QUERY_ENGINE_TYPE":"binary"
  };
  final binaryName =
      checkForExtension(Platform.operatingSystem, binaryPlatformName());
  for (var engine in Engine.engines) {
    final engEnv = getEnv(engine.env);
    if (engEnv.isNotEmpty) {
      env[engine.env] = engEnv;
    } else {
      env[engine.env] =
          join(dir, engineVersion, "prisma-${engine.name}-$binaryName");
    }
  }

  var join2 = join(dir, prisma);
  print(join2);
  final out = await Process.run(join2, args, environment: env);
  print(out.stdout);
  print(out.stderr);
}
