import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: 'l o g o',
        style: Theme.of(context).textTheme.overline!.copyWith(
              color: ThemeColor.secondary2,
              fontSize: 32,
            ),
      ),
      TextSpan(
        text: ' .',
        style: Theme.of(context).textTheme.overline!.copyWith(
              color: ThemeColor.accent,
              fontSize: 32,
            ),
      ),
    ]));
  }
}
