//////////////////////////////////////////////////////////////////////////
/// Global Static Class - This would typically be in another code file ///
//////////////////////////////////////////////////////////////////////////

class GlobalStatic {
  static final GlobalStatic _globalStatic = GlobalStatic._internal();

  int _counter = 0;

  GlobalStatic._internal();

  factory GlobalStatic() {
    GlobalStatic._internal();
    return _globalStatic;
  }

  int get counter {
    return _counter;
  }

  void incrementCounter() {
    _counter++;
  }
}