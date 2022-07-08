// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/globalProviders/counterProvider.dart';
import 'package:riverpod_example_project/views/03_providerAutoDisposeExampleView/c_p_counterAutodisposeProvider.dart';

class ProviderAutoDisposeExampleView extends StatefulWidget {
  /// View for both showing .autoDispose modifier for providers and referencing
  /// another provider.
  ///
  /// This example consists of two card widgets. The first card widget shows the
  /// provider that is also used in the first Provider example. The second
  /// widget shows a counter provider with an .autoDispose modifier.
  const ProviderAutoDisposeExampleView({Key? key}) : super(key: key);

  @override
  State<ProviderAutoDisposeExampleView> createState() =>
      _ProviderAutoDisposeExampleViewState();
}

class _ProviderAutoDisposeExampleViewState
    extends State<ProviderAutoDisposeExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider .autoDispose() example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Counter from Provider'),
                    Consumer(builder: (context, ref, child) {
                      return Text(
                        // Use ref.watch() to observe the provider variables. 
                        ref.watch(counterProvider).counter.toString(),
                        style: Theme.of(context).textTheme.headline3,
                      );
                    }),
                    Consumer(builder: (context, ref, child) {
                      return TextButton(
                          onPressed: () {
                            /// Function works the same as the POCO example except this
                            /// example uses a provider.
                            setState(
                              () {
                                {
                                  // Use ref.read() for calling methods that update the
                                  // provider state.
                                  ref.read(counterProvider).increaseCounter();
                                }
                              },
                            );
                          },
                          child: const Text('Increase counter'));
                    }),
                    Consumer(builder: (context, ref, child) {
                      return TextButton(
                          onPressed: () {
                            /// provider method call but with setState() omitted
                            ref.read(counterProvider).increaseCounter();
                          },
                          child: const Text(
                              'Increase counter (without setState())'));
                    }),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Counter from Provider.autoDispose'),
                    Consumer(builder: (context, ref, child) {
                      return Text(
                        ref
                            .watch(counterAutoDisposeProvider)
                            .counter
                            .toString(),
                        style: Theme.of(context).textTheme.headline3,
                      );
                    }),
                    Consumer(builder: (context, ref, child) {
                      return TextButton(
                          onPressed: () {
                            /// Function works the same as the POCO example except this
                            /// example uses an .autoDispose provider
                            setState(
                              () {
                                {
                                  ref.read(counterAutoDisposeProvider).increaseCounter();
                                }
                              },
                            );
                          },
                          child: const Text('Increase counter'));
                    }),
                    Consumer(builder: (context, ref, child) {
                      return TextButton(
                          onPressed: () {
                            /// provider method call but with setState() omitted
                            ref.read(counterAutoDisposeProvider).increaseCounter();
                          },
                          child: const Text(
                              'Increase counter (without setState())'));
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
