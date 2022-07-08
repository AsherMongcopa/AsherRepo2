// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:riverpod_example_project/views/00_5_pocoExampleView/c_co_counterClass.dart';

class POCOExampleView extends StatefulWidget {
  /// View for POCO example.
  ///
  /// If the POCO is used as an object that needs to be state managed, the widget
  /// needs to be a StatefulWidget. If the POCO is a stateless controller, using a
  /// StatelessWidget is fine.
  const POCOExampleView({Key? key}) : super(key: key);

  @override
  State<POCOExampleView> createState() => _POCOExampleViewState();
}

class _POCOExampleViewState extends State<POCOExampleView> {
  /// To add a POCO (plain old class object) to a view, the object needs to be
  /// initialized. This can be done by initializing the variable outside the
  /// build method. This is done because when the app calls setState() in the
  /// view, the whole build() method is called and all the elements inside the
  /// method are rebuilt.

  /// The placement of the POCO variable does not matter when using the object in
  /// a StatelessWidget.

  /// The POCO is disposed as soon as the view is disposed. This instance cannot
  /// be used in other views.

  late CounterClass? counterClass;

  @override
  void initState() {
    // Instantiates the class when the view is built
    counterClass = CounterClass();

    super.initState();
    
    print('StatefulWidget initialize');
  }

  @override
  void dispose() {
    counterClass = null;
    super.dispose();

    print('StatefulWidget disposed');
  }

  @override
  Widget build(BuildContext context) {
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
                counterClass!.counter.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
              TextButton(
                  onPressed: () {
                    /// POCO method needs to be inside a setState() to show the current
                    /// state.
                    ///
                    /// setState() notifies the app to rebuild the view. All elements are
                    /// re-rendered.
                    setState(
                      () {
                        {
                          counterClass!.increaseCounter();
                        }
                      },
                    );
                  },
                  child: const Text('Increase counter')),
              TextButton(
                  onPressed: () {
                    /// Calling a POCO method without setState will update the state of the
                    /// variable inside the object, but it is not reflected in the UI unless
                    /// setState() is called.
                    counterClass!.increaseCounter();
                  },
                  child: const Text('Increase counter (without setState())')),
            ],
          ),
        ));
  }
}
