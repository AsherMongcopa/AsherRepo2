import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
    required this.imgLocation,
    this.hasNotification = false,
  }) : super(key: key);

  final String imgLocation;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Stack(
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imgLocation)),
                shape: BoxShape.circle),
          ),
          hasNotification
              ? Positioned(
                  left: 20,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: notificationColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
