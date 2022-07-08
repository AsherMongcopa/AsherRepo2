import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class FileListHeader extends StatelessWidget {
  const FileListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Files',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: ThemeColor.main),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View all',
                    style: TextStyle(color: ThemeColor.main),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: ThemeColor.main,
                      size: 14,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
