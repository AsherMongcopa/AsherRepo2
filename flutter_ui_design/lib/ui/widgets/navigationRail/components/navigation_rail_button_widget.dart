import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class NavigationRailButtonWidget extends StatelessWidget {
  const NavigationRailButtonWidget({
    Key? key,
    required this.onTap,
    required this.isSelected,
    this.hasNotification = false,
    required this.icon,
  }) : super(key: key);

  final Function onTap;
  final bool isSelected;
  final bool hasNotification;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: SizedBox(
        width: 80,
        height: 75,
        child: Center(
          child: Stack(
            children: [
              Icon(
                icon,
                color: isSelected ? primaryColor : Colors.grey.shade600,
              ),
              hasNotification
                  ? Positioned(
                      left: 17,
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
        ),
      ),
    );
  }
}
