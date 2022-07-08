

import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/calendar_widget.dart';

class CalendarDialog extends StatelessWidget {
  const CalendarDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Row(children: [
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: ThemeColor.main,
          ),
          splashRadius: 20,
        ),
      ]),
      children: const [
        SizedBox(
          width: 350,
          child: CalendarWidget(),
        )
      ],
    );
  }
}
