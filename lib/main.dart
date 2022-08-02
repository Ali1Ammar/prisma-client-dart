import 'dart:io';

import 'package:prisma_dart/generator.dart';
import 'package:prisma_dart/helper/cahce_dir.dart';
import 'package:prisma_dart/src/cli/cli.dart';

void main(List<String> args) async {  
  if (args.isNotEmpty) {
    if (args[0] == "prefetch") {
      await runCli(["-v"], true);
      return;
    }
    await runCli(args, true);
    return;
  }

  if (getEnv("PRISMA_GENERATOR_INVOCATION").isEmpty) {
    print(
        "This command is only meant to be invoked internally. Please run the following instead:");
    print("`dart run main.dart <command>`");
    print("e.g.");
    print("`dart run main.dart  generate`");
    exit(1);
  }
  print("invoking prisma");

  invokePrisma();
}
