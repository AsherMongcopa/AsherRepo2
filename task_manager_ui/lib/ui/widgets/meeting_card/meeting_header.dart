import 'package:flutter/material.dart';

import 'package:task_manager_ui/constant.dart';

class MeetingHeader extends StatelessWidget {
  const MeetingHeader({
    Key? key,
    required this.onDatePressed,
  }) : super(key: key);

  final Function onDatePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 5, 14, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Meeting',
            style: Theme.of(context)
                .textTheme
                .headline5!
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
                  'Aug 3, 2021 - Aug 7, 2021',
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
