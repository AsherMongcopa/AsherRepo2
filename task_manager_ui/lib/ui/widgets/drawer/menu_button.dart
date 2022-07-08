import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(primary: Colors.transparent),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(text,
            style: TextStyle(
              color: ThemeColor.secondary2,
              fontSize: 25,
            )),
      ),
    );
  }
}
