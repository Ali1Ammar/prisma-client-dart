import 'dart:io';

String? binaryNameWithSSLCache;

String binaryPlatformName() {
  if (binaryNameWithSSLCache != null) {
    return binaryNameWithSSLCache!;
  }

  final os = Platform.operatingSystem;
  if (os != "linux") return os;
  final distro = getLinuxDistro();
  if (distro == "alpine") return "linux-musl";
  final ssl = getOpenSSL();
  binaryNameWithSSLCache = "$distro-openssl-$ssl";
  return binaryNameWithSSLCache!;
}

String checkForExtension(String platform, String path) {
  if (platform == "windows") {
    if (path.contains(".gz")) {
      return path.replaceFirst(".gz", ".exe.gz");
    }
    return "$path.exe";
  }
  return path;
}

String getLinuxDistro() {
  final procRes = Process.runSync("cat", ["/etc/os-release"]);
  final out = procRes.stdout as String;
  if (out.isEmpty) return "debian";
  return parseLinuxDistro(out);
}

String parseLinuxDistro(String str) {
  String id = "";
  String idLike = "";
  final matchs = _matchFirstStr('^ID="?([^"\n]*)"?', str);
  if (matchs != null) {
    id = matchs;
  }

  final likeMatchs = _matchFirstStr('^ID_LIKE="?([^"\n]*)"?', str);
  if (likeMatchs != null) {
    idLike = likeMatchs;
  }
  if (id == "alpine") {
    return "alpine";
  }
  final likerhel = ["centos", "fedora", "rhel"];
  if (likerhel.any((element) => element == idLike) || id == "fedora") {
    return "rhel";
  }

  final likedebian = ["debian", "ubuntu"];
  if (likedebian.any((element) => element == idLike) || id == "debian") {
    return "debian";
  }
  return "debian";
}

Future<String> getOpenSSL() async {
  final procRes = await Process.run("openssl", ["version", "-v"]);
  final out = procRes.stdout as String;
  if (out.isEmpty) return "";
  return parseOpenSSLVersion(out);
}

String parseOpenSSLVersion(String str) {
  final matchs = _matchFirstStr(r'^OpenSSL\s(\d+\.\d+)\.\d+', str);
  if (matchs == null) return "1.1.x";
  return "$matchs.x";
}

String? _matchFirstStr(String reg, String match) =>
    RegExp(reg, multiLine: true).allMatches(match).first.group(1);
