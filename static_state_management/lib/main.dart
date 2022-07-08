////////////////////////////////////////////////////////////////////////////////////////
///  Static Class State Management, Author: Chuck Bagby, Copyright: MIT license ///
////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:static_state_management/views/a_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AScreen(),
    );
  }
}
