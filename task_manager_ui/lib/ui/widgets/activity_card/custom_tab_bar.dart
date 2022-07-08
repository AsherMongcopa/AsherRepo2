import 'package:flutter/material.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/custom_tab_button.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTabButton(
              text: 'Recently Added',
              isSelected: true,
              onPressed: () {},
            ),
            CustomTabButton(
              text: 'In Progress',
              isSelected: false,
              onPressed: () {},
            ),
            CustomTabButton(
              text: 'In Review',
              isSelected: false,
              onPressed: () {},
            ),
            CustomTabButton(
              text: 'Completed',
              isSelected: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
