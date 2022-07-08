import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/drawer/drawer_icon_button.dart';
import 'package:task_manager_ui/ui/widgets/drawer/logo.dart';

class FullDrawer extends StatelessWidget {
  const FullDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      decoration: BoxDecoration(color: ThemeColor.main),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 40, 0, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 60),
              child: Logo(),
            ),
            DrawerIconButton(
              label: 'Profile',
              icon: Icons.person,
              onPressed: () {},
              isSelected: false,
            ),
            DrawerIconButton(
              label: 'Schedule',
              icon: Icons.calendar_today,
              onPressed: () {},
              isSelected: true,
            ),
            DrawerIconButton(
              label: 'Overview',
              icon: Icons.assessment,
              onPressed: () {},
              isSelected: false,
            ),
            DrawerIconButton(
              label: 'Chat',
              icon: Icons.chat_bubble,
              onPressed: () {},
              isSelected: false,
            ),
            DrawerIconButton(
              label: 'Settings',
              icon: Icons.settings,
              onPressed: () {},
              isSelected: false,
            ),
            const Spacer(),
            DrawerIconButton(
              label: 'Logout',
              icon: Icons.logout,
              onPressed: () {},
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }
}
