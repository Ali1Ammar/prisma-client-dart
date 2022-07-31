import 'dart:io';

Future<void> main(List<String> args) async {
  print(await getOpenSSL());
}




Future<String> getOpenSSL() async {
  final procRes = await Process.run("openssl", ["version","-v"]);
  final out = procRes.stdout as String;
  if(out.isEmpty) return "";
  return parseOpenSSLVersion(out);
}

String parseOpenSSLVersion(String str){
  final matchs = _matchFirstStr(r'^OpenSSL\s(\d+\.\d+)\.\d+',str);
  if(matchs==null) return "1.1.x";
  return "$matchs.x";
}

String? _matchFirstStr(String reg,String match)=>RegExp(reg,multiLine: true).allMatches(match).first.group(1);
