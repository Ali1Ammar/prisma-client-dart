
import 'prisma/prisma.dart';

Future<void> main(List<String> args) async {
  
  PrismaClient client = PrismaClient();
  await client.engine.connect();
  // await client.engine.disconnect();
}