// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/04_stateNotifierProviderView/c_snp_counterState.dart';

class StateNotifierProviderView extends StatelessWidget {
  /// View for a StateNotifierProvider example
  ///
  /// A StateNotifierProvider is a provider that is commonly used to manage
  /// state in a view. It allows the view to update the elements whenever the
  /// state in the provider is updated.
  /// 
  /// Note that the view does not need a StatefulWidget to update a state. A
  /// StatelessWidget is fine for Riverpod state management, although a
  /// StatefulWidget can also be used if it is combined with traditional Flutter 
  /// state management.
  const StateNotifierProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StateNotifierProvider example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Number of times the button was clicked'),
              Consumer(builder: (context, ref, child) {
                return Text(
                  // Call the provider to observe the value of the 'state'
                  // variable in a StateNotifierProvider.
                  ref.watch(counterState).toString(),
                  style: Theme.of(context).textTheme.headline3,
                );
              }),
              Consumer(builder: (context, ref, child) {
                return TextButton(
                    onPressed: () {
                      /// To call a method from the provider class, add the
                      /// .notifier to access the provider class.
                      ref.read(counterState.notifier).increaseCounter();
                    },
                    child: const Text('Increase counter'));
              }),
            ],
          ),
        ));
  }
}
