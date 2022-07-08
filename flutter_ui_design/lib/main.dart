import 'package:flutter/material.dart';
import 'package:flutter_ui_design/ui/views/dashboard_view.dart';
import 'package:flutter_ui_design/ui/widgets/graphWidget/graph_widget.dart';

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
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}
