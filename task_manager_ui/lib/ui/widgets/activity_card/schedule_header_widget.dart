import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class ScheduleHeaderWidget extends StatelessWidget {
  const ScheduleHeaderWidget({
    Key? key,
    required this.onDatePressed,
  }) : super(key: key);

  final Function onDatePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Schedule',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: ThemeColor.main),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(primary: ThemeColor.idle),
            onPressed: () => onDatePressed(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Aug 5, 2021',
                  style: TextStyle(fontSize: 14, color: ThemeColor.main),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: ThemeColor.main,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
