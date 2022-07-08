import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/views/schedule_view.dart';

// design based on https://dribbble.com/shots/16577616-Task-manager-responsive-dashboard-design

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
        // primarySwatch: Colors.blue,
        primarySwatch: ThemeColor.swatch,
        primaryColor: ThemeColor.main,
      ),
      debugShowCheckedModeBanner: false,
      home: ScheduleView(),
    );
  }
}
