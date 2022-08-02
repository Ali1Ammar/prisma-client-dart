import 'dart:io';

import 'package:path/path.dart';
import 'package:prisma_dart/src/binaries/binaries.dart';
import 'package:prisma_dart/src/binaries/platform/platform.dart';

// void unPack(String data, String name, String version) {
//   final file = "prisma-query-engine-$name";
//   final temp = globalUnpackDir(version);
//   final dir = checkForExtension(Platform.operatingSystem, join(temp, file));
//   Directory(temp).create(recursive: true);
//   final fileTo = File(dir);
//   if(File(dir).existsSync()){
//     print("uery engine exists, not unpacking. ");
//     return;
//   }
//   fileTo.writeAsStringSync(data);
//   print("unpacked at");

// }

//TOOD this added by me as a replace for unpack
void copyEngineToUnpackTmp(String path, String name, String version) {
  final file = "prisma-query-engine-$name";
  final temp = globalUnpackDir(version);
  final dir = checkForExtension(Platform.operatingSystem, join(temp, file));
  Directory(temp).createSync(recursive: true);
  final fileTo = File(dir);
    print("try copy from unpack $path to ${fileTo.path}");

  if(File(dir).existsSync()){
    print("Query engine exists, not unpacking. ");
    return;
  }
  File(path).copySync(fileTo.path);
  print("unpacked at ${fileTo.path}");

}
