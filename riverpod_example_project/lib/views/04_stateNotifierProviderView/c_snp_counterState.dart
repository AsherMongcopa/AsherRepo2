// ignore_for_file: avoid_print, file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A StateNotifierProvider that uses a counter class similar to the previous
/// examples (POCO, Provider examples)
final counterState = StateNotifierProvider.autoDispose(((ref) {
  print('counterState instance created.');

  ref.onDispose(() {
    /// This function only starts when the provider is no longer used (the view
    /// is disposed).
    print('counterState instance disposed.');
  });

  // This provider can only return a class with StateNotifier extended
  return CounterStateController();
}));

// It is good practice to explicitly show the data type of the 'state' variable
// This class requires a constructor with a super. You have the option to either
// pass the starting variable from the provider method or pass the starting
// value directly to the super.
class CounterStateController extends StateNotifier<int> {
  CounterStateController() : super(0);

  increaseCounter() {
    // The state calls a notifyListener() (state update method) when the 'state'
    // variable is updated.
    // 
    // If the state variable is a complex data type like an object or a list,
    // modifying the elements inside the list will not update the state, but
    // giving the 'state' variable the updated value will trigger the update.
    state++;
  }
}
