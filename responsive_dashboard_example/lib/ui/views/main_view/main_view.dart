import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/app_bar_content.dart';

import 'package:responsive_dashboard_example/ui/widgets/components/custom_grid_view.dart';
import 'package:responsive_dashboard_example/ui/widgets/components/responsive.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/custom_drawer.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/customer_list_card.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/dashboard_quantity_item.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/menu_button.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/projects_table.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawerEnableOpenDragGesture: true,
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              leading: Container(
                alignment: Alignment.center,
                child: MenuButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
              ),
              title: const AppBarContent(),
            ),
      drawer: const CustomDrawer(
        isExpanded: true,
      ),
      body: Row(
        children: [
          if (Responsive.isDesktop(context)) const CustomDrawer(),
          Expanded(
            child: Column(
              children: [
                if (Responsive.isDesktop(context))
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          alignment: Alignment.center,
                          child: MenuButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        ),
                        const Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: AppBarContent(),
                        )),
                      ],
                    ),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 3,
                          offset: const Offset(0, 5))
                    ]),
                  ),
                Expanded(
                  child: Container(
                    color: Colors.blue.shade100.withOpacity(0.2),
                    child: ListView(
                      children: [
                        CustomGridView(
                            itemsPerRow: itemsPerRow(context),
                            children: const [
                              DashboardQuantityItem(
                                icon: Icons.group_outlined,
                                value: '54',
                                type: 'Customers',
                              ),
                              DashboardQuantityItem(
                                icon: Icons.paste,
                                value: '79',
                                type: 'Projects',
                              ),
                              DashboardQuantityItem(
                                icon: Icons.shopping_bag_outlined,
                                value: '124',
                                type: 'Orders',
                              ),
                              DashboardQuantityItem(
                                isHighlighted: true,
                                icon: Icons.monetization_on_outlined,
                                value: '\$6k',
                                type: 'income',
                              ),
                            ]),
                        Responsive(
                            mobile: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: ProjectsTable(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: CustomerListCard(),
                                )
                              ],
                            ),
                            desktop: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: ProjectsTable(),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: CustomerListCard(),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int itemsPerRow(BuildContext context) {
    if (Responsive.isDesktopLarge(context)) {
      return 4;
    } else if (Responsive.isDesktopSmall(context)) {
      return 3;
    } else if (Responsive.isTablet(context)) {
      return 2;
    } else {
      return 1;
    }
  }
}