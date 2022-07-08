import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class MenuAccentDesign extends StatelessWidget {
  const MenuAccentDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      alignment: Alignment.bottomCenter,
      child: Divider(color: ThemeColor.accent),
    );
  }
}
