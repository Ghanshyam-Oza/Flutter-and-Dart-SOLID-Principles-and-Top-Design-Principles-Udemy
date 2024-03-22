abstract class Singleton {
  Singleton._privateConstructor();
}

class SequenceGenerator extends Singleton {
  SequenceGenerator._privateConstructor() : super._privateConstructor();

  static final SequenceGenerator _instance =
      SequenceGenerator._privateConstructor();

  int _counter = 0;

  factory SequenceGenerator() {
    return _instance;
  }

  incrementNumber() {
    _counter++;
  }

  getCurrentNumber() {
    return _counter;
  }
}
