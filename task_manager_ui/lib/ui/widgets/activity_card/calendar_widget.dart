import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
        initialDate: DateTime.parse('2021-08-25'),
        firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
        lastDate: DateTime.now(),
        onDateChanged: (date) {
          Navigator.pop(context);
        });
  }
}
