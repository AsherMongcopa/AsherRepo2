

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/components/custom_drawer_button.dart';

class CompactDrawerMenu extends StatelessWidget {
  const CompactDrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kMainColor,
      child: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          CustomDrawerButton(
            isSelected: true,
            icon: Icons.cottage_outlined,
          ),
          CustomDrawerButton(
            icon: Icons.group_outlined,
          ),
          CustomDrawerButton(
            icon: Icons.paste_outlined,
          ),
          CustomDrawerButton(
            icon: Icons.shopping_bag_outlined,
          ),
          CustomDrawerButton(
            icon: Icons.receipt_long_outlined,
          ),
          CustomDrawerButton(
            icon: Icons.account_circle_outlined,
          ),
          CustomDrawerButton(
            icon: Icons.paste_outlined,
          ),
        ],
      ),
    );
  }
}