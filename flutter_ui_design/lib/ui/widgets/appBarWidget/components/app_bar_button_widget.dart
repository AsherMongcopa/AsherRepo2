import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class AppBarButtonWidget extends StatelessWidget {
  const AppBarButtonWidget(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.hasNotification = false})
      : super(key: key);

  final IconData icon;
  final Function onTap;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        width: 45,
        height: 45,
        child: Center(
          child: Stack(
            children: [
              Icon(icon),
              hasNotification
                  ? Positioned(
                      left: 15,
                      child: Container(
                        width: 9,
                        height: 9,
                        child: Center(
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              color: notificationColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 5,
            color: primaryColor.withOpacity(0.1),
          ),
          BoxShadow(
              offset: const Offset(0, 35),
              blurRadius: 15,
              color: primaryColor.withOpacity(0.1))
        ]),
      ),
    );
  }
}
