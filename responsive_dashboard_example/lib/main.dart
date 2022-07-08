import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/ui/views/main_view/main_view.dart';

// Responsive Flutter Dashboard UI example
// Design based on https://www.youtube.com/watch?v=OJEQaVT45XA
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}