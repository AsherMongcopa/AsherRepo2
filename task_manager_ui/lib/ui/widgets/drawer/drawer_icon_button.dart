

import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextButton.icon(
        onPressed: () => onPressed(),
        icon: Icon(icon,
            color: isSelected ? ThemeColor.secondary2 : ThemeColor.idle2),
        label: Text(label,
            style: TextStyle(
                color: isSelected ? ThemeColor.secondary2 : ThemeColor.idle2)),
      ),
    );
  }
}