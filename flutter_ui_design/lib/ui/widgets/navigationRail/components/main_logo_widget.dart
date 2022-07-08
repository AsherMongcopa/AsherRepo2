import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class MainLogoWidget extends StatelessWidget {
  const MainLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 40,
        height: 40,
        child: Center(
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
          ),
        ),
        decoration:
            const BoxDecoration(color: primaryColor, shape: BoxShape.circle),
      ),
    );
  }
}