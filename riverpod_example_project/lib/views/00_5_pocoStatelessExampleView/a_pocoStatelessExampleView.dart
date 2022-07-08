// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:riverpod_example_project/views/00_5_pocoStatelessExampleView/c_co_counterClass.dart';

class POCOStatelessExampleView extends StatelessWidget {
  const POCOStatelessExampleView({Key? key}) : super(key: key);

  /// View for POCO StatelessWidget example.
  ///
  /// If the POCO is used in a StatelessWidget, the methods inside it will still
  /// work, but the UI will not update.
  /// 
  /// A StatelessWidget does not have a way to update the UI.

  @override
  Widget build(BuildContext context) {
    final CounterClass counterClass = CounterClass();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Class object example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Number of times the button was clicked'),
              Text(
                counterClass.counter.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
              TextButton(
                  onPressed: () {
                    /// POCO method needs to be inside a setState() to show the current
                    /// state.
                    counterClass.increaseCounter();
                  },
                  child: const Text('Increase counter')),
            ],
          ),
        ));
  }
}
