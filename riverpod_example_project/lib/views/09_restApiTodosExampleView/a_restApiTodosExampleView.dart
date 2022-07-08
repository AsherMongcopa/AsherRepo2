// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/09_restApiTodosExampleView/c_fp_getTodos.dart';

/// Rest API Todos FutureProvider example view
///
/// Another Rest API example but using https://jsonplaceholder.typicode.com/todos
/// for data.
class RestApiTodosExampleView extends StatelessWidget {
  const RestApiTodosExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Rest API Todos Example')),
        body: Consumer(builder: (context, ref, child) {
          // Calling the .when() method for the getTodos provider
          return ref.watch(getTodos).when(
              data: (data) {
                // Generates a ListView for the Todo list
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) => ListTile(
                          leading: data.elementAt(index).completed
                              ? const Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                )
                              : const Icon(Icons.check_box_outline_blank),
                          title: Text(data.elementAt(index).title),
                        )));
              },
              error: (e, _) => const Center(
                    child: Icon(Icons.error),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ));
        }));
  }
}
