// ignore_for_file: avoid_print, file_names

class CounterClass {
  /// Class for manipulating the counter in the example.
  /// 
  /// A plain old class object (POCO) does not have built-in state management.
  /// State management using POCOs usually rely on external methods of state
  /// management. POCOs are better utilized for handling local methods and
  /// variables that do not need to be state managed (controller).
  
  int counter = 0;

  CounterClass() {
    print('CounterClass (Stateful) created, Counter variable at $counter');
  }
  
  increaseCounter() {
    counter++;

    print("Number of times button is pressed: $counter");
  }
}
