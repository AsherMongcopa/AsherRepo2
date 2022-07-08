import 'package:flutter/material.dart';
import 'package:responsive_flutter_ui/ui/views/main/main_screen.dart';

// Project derived from https://github.com/abuanwar072/Flutter-responsive-email-ui---Mobile-Tablet-and-Web

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
      debugShowCheckedModeBanner: false,
      home: const ResponsiveView(),
    );
  }
}