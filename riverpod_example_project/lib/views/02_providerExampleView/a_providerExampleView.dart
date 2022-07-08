// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/globalProviders/counterProvider.dart';

class ProviderExampleView extends StatefulWidget {
  /// View for counter example using a Provider widget.
  ///
  /// The provider used in this example has similarities with the POCO example.
  /// The provider uses the same class as the POCO example. Both examples use
  /// a StatefulWidget to update the state. The difference between the two is
  /// that while the POCO class needed to be instantiated first inside the
  /// view, Providers do not need to be explicitly instantiated to be used in a
  /// view.
  const ProviderExampleView({Key? key}) : super(key: key);

  @override
  State<ProviderExampleView> createState() => _ProviderExampleViewState();
}

class _ProviderExampleViewState extends State<ProviderExampleView> {
  // Unlike the POCO example, this example does not need to instantiate the
  // provider. Providers are instantiated when it is first used by a view.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Number of times the button was clicked'),
              // Consumers are an important widget for providers. They provide
              // a reference for calling providers, and isolate a state update
              // in the UI to a few widgets, in contrast to rebuilding the whole
              // view using setState().
              //
              // The latter is useful for situations where providers with state
              // management are used.
              Consumer(builder: (context, ref, child) {
                return Text(
                  ref.watch(counterProvider).counter.toString(),
                  style: Theme.of(context).textTheme.headline3,
                );
              }),
              Consumer(builder: (context, ref, child) {
                  return TextButton(
                      onPressed: () {
                        /// Function works the same as the POCO example except this
                        /// example uses a provider
                        setState(
                          () {
                            {
                              ref.read(counterProvider).increaseCounter();
                            }
                          },
                        );
                      },
                      child: const Text('Increase counter'));
                }
              ),
              Consumer(builder: (context, ref, child) {
                  return TextButton(
                      onPressed: () {
                        /// provider method call but with setState() omitted
                        ref.read(counterProvider).increaseCounter();
                      },
                      child: const Text('Increase counter (without setState())'));
                }
              ),
            ],
          ),
        ));
  }
}
