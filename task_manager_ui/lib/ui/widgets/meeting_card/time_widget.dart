import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
      child: Text(
        text,
        style: TextStyle(color: ThemeColor.idle),
      ),
    );
  }
}
