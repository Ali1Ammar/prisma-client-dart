

import 'package:prisma_dart/src/engine/engine.dart';

 class Lifecycle {
  final Engine engine;

  Lifecycle(this.engine);

  void connect(){
    engine.connect();//TODO may become async
  }
  void disConnect(){
    engine.disconnect();
  }

}