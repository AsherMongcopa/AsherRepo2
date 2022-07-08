// ignore_for_file: avoid_print, file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider can be based on a basic data type or a class.
final counterProvider = Provider(((ref) {
  /// A provider has a reference that you can use to call other providers and
  /// other useful methods to use when a provider is instantiated

  print('counterProvider instance created.');

  ref.onDispose(() {
    /// This function only starts when the provider is no longer used (the view
    /// is disposed).
    print('counterAutoDisposeProvider instance disposed.');
  });
  
  return CounterClass();
}));

class CounterClass {
  // Identical class that is also used in the POCO example
  int counter = 0;

  increaseCounter() {
    counter++;

    print("Number of times button is pressed: $counter");
  }
}
