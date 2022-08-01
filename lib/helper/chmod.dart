
import 'dart:io';

Future makeExecutable(String file) async {
  if (!Platform.isWindows) {
    return Process.run("chmod", ["u+x", file]).then((result) {
      if (result.exitCode != 0) throw  Exception(result.stderr);
    });
  }
}
void makeExecutableSync(String file) {
  if (!Platform.isWindows) {
    var result = Process.runSync("chmod", ["u+x", file]);
    if (result.exitCode != 0) throw Exception(result.stderr);
  }
}
