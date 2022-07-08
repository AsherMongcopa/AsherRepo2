import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
    this.isTransparent = false,
  }) : super(key: key);

  final Function onPressed;
  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isTransparent ? Colors.transparent : kMainColor,
        onPrimary: isTransparent ? Colors.transparent : null,
        shadowColor: isTransparent ? Colors.transparent : null,
        minimumSize: const Size.square(50),
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      child: const Icon(Icons.menu),
      onPressed: () {
        onPressed();
      },
    );
  }
}
