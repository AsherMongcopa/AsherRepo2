// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_example_project/views/08_restApiExampleView/ma_photoModel.dart';

// FutureProvider for PhotoModel Rest API
//
// Another use for FutureProviders is for RestAPI. This particular
// Rest API gets its data from https://jsonplaceholder.typicode.com/photos.
// If the request fails, it returns an Exception. 
final getImages = FutureProvider.autoDispose<List<PhotoModel>>((ref) async {
  var json =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (json.statusCode == 200) {
    List<dynamic> list = jsonDecode(json.body) as List? ?? [];

    return List.generate(
        list.length, (index) => PhotoModel.fromMap(list.elementAt(index)));
    // return [];
  } else {
    throw Exception('Failed to load images');
  }
});
