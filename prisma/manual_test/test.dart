
import '../generated/prisma.dart';

void main(List<String> args) {
  final x = PrismaClient();
  x.engine.connect();
}