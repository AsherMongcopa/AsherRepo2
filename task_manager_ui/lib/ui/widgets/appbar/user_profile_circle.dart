

import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class UserProfileCircle extends StatelessWidget {
  const UserProfileCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 35,
        height: 35,
        child: const Center(
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        decoration:
            BoxDecoration(color: ThemeColor.accent, shape: BoxShape.circle),
      ),
    );
  }
}