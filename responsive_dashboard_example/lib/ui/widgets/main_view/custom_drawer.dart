

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/components/compact_drawer_menu.dart';
import 'package:responsive_dashboard_example/ui/widgets/components/responsive.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/components/full_drawer_menu.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/menu_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExpanded ? 350 : 75,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Responsive.isDesktop(context)
              ? Container(
                  height: 80,
                  color: kMainColor,
                )
              : Container(
                  alignment: Alignment.centerLeft,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MenuButton(
                      isTransparent: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
          Expanded(
              child: isExpanded
                  ? const FullDrawerMenu()
                  : const CompactDrawerMenu())
        ],
      ),
    );
  }
}