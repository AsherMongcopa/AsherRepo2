

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/components/custom_drawer_tile.dart';

class FullDrawerMenu extends StatelessWidget {
  const FullDrawerMenu({
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
          CustomDrawerTile(
            isSelected: true,
            icon: Icons.cottage_outlined,
            label: 'Dashboard',
          ),
          CustomDrawerTile(
            icon: Icons.group_outlined,
            label: 'Customers',
          ),
          CustomDrawerTile(
            icon: Icons.paste_outlined,
            label: 'Projects',
          ),
          CustomDrawerTile(
            icon: Icons.shopping_bag_outlined,
            label: 'Orders',
          ),
          CustomDrawerTile(
            icon: Icons.receipt_long_outlined,
            label: 'Inventory',
          ),
          CustomDrawerTile(
            icon: Icons.account_circle_outlined,
            label: 'Accounts',
          ),
          CustomDrawerTile(
            icon: Icons.paste_outlined,
            label: 'Customers',
          ),
        ],
      ),
    );
  }
}
