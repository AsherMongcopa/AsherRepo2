import 'package:flutter/material.dart';

import 'package:flutter_ui_design/ui/widgets/appBarWidget/app_bar_widget.dart';
import 'package:flutter_ui_design/ui/widgets/chartContainerWidget/chart_container_widget.dart';
import 'package:flutter_ui_design/ui/widgets/courseListWidget/course_list_widget.dart';
import 'package:flutter_ui_design/ui/widgets/dashboardOptionsWidget/dashboard_options_widget.dart';
import 'package:flutter_ui_design/ui/widgets/dashboardTitleWidget/dashboard_title_widget.dart';
import 'package:flutter_ui_design/ui/widgets/navigationRail/navigation_rail_widget.dart';

// Dashboard UI based on https://dribbble.com/shots/16959094-learning-platform-dashboard-ui-concept

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavigationRailWidget(),
          Expanded(
              child: Column(
            children: [
              const AppBarWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // dashboard title, subtitle and explore more button
                      const DashboardTitleWidget(),
                      // 5 picks for courses column
                      const CourseListWidget(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 50, 35, 0),
                        child: Row(
                          children: const [
                            // learning curve graph container
                            Expanded(child: ChartContainerWidget()),
                            // Spacer(),
                            SizedBox(
                              width: 50,
                            ),
                            // 6 buttons and transfer button
                            DashboardOptionsWidget()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}