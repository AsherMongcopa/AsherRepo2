import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class CustomTabButton extends StatelessWidget {
  const CustomTabButton({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
          style: TextButton.styleFrom(
              primary: isSelected ? ThemeColor.main : ThemeColor.idle2),
          onPressed: () => onPressed(),
          child: Text(
            text,
            style: TextStyle(
                decoration: isSelected ? TextDecoration.underline : null),
          )),
    );
  }
}
