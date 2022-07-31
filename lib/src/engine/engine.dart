

abstract class Engine {
  connect();
  disconnect();
  execute(Map payload, Map into);
  batch(Map payload, Map into);
  name();
}
