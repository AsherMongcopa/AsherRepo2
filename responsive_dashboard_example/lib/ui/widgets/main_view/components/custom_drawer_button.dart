

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    Key? key,
    this.isSelected = false,
    required this.icon,
  }) : super(key: key);

  final bool isSelected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 4, top: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: isSelected ? kMainColor : Colors.white,
            primary: isSelected ? Colors.white : kMainColor,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)))),
        onPressed: () {
          if (isSelected) {
            return;
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Icon(icon),
        ),
      ),
    );
  }
}

