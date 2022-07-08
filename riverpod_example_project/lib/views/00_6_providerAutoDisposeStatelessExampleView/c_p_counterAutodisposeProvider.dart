// ignore_for_file: avoid_print, file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider based on basic counter provider but with .autoDispose modifier
final counterAutoDisposeProvider = Provider.autoDispose(((ref) {
  print('counterAutoDisposeProvider instance created.');

  ref.onDispose(() {
    /// This function only starts when the provider is no longer used (the view
    /// is disposed).
    print('counterAutoDisposeProvider instance disposed.');
  });

  return CounterAutoDisposeClass();
}));

class CounterAutoDisposeClass {
  // Counter class
  int counter = 0;

  increaseCounter() {
    counter++;

    print("Number of times button is pressed: $counter");
  }
}
