// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/08_restApiExampleView/c_fp_getImages.dart';

/// Rest API FutureProvider example view
/// 
/// This is an example of using FutureProvider to get a list of JSON
/// objects from the web using a Rest API. The data is taken from
/// https://jsonplaceholder.typicode.com/photos, and this view outputs
/// the list, showing the thumbnails.
class RestApiExampleView extends StatelessWidget {
  const RestApiExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Rest API Example')),
        body: Consumer(builder: (context, ref, child) {
          // Calling the .when() method for the getImages provider
          return ref.watch(getImages).when(
              data: (data) {
                // Generates a 3-column grid for the retrieved data
                return GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(
                      data.length,
                      (index) => Card(
                            child: Image.network(
                                data.elementAt(index).thumbnailUrl),
                          )),
                );
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
