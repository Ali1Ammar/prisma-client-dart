import 'dart:io';

import 'package:path/path.dart';
import 'package:prisma_dart/src/binaries/binaries.dart';
import 'package:prisma_dart/src/binaries/platform/platform.dart';

void unPack(String data, String name, String version) {
  final file = "prisma-query-engine-$name";
  final temp = globalUnpackDir(version);
  final dir = checkForExtension(Platform.operatingSystem, join(temp, file));
  Directory(temp).create(recursive: true);
  final fileTo = File(dir);
  if(File(dir).existsSync()){
    print("uery engine exists, not unpacking. ");
    return;
  }
  fileTo.writeAsStringSync(data);
  print("unpacked at");

}
