

abstract class Engine {
  connect();
  disconnect();
  Map<String,dynamic> execute(Map<String,dynamic> payload);
  Map<String,dynamic> batch(Map<String,dynamic> payload);
  name();
}
