// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_example_project/views/09_restApiTodosExampleView/ma_todosModel.dart';

// FutureProvider to get todo list
final getTodos = FutureProvider.autoDispose<List<TodosModel>>((ref) async {
  var json =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  if (json.statusCode == 200) {
    List<dynamic> list = jsonDecode(json.body) as List? ?? [];

    return List.generate(
        list.length, (index) => TodosModel.fromMap(list.elementAt(index)));
    // return [];
  } else {
    throw Exception('Failed to load images');
  }
});
