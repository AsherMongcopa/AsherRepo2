

import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';
import 'package:flutter_ui_design/ui/widgets/dashboardOptionsWidget/components/course_options_widget.dart';

class DashboardOptionsWidget extends StatelessWidget {
  const DashboardOptionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CourseOptionsWidget(
                icon: Icons.layers_outlined,
                title: 'Courses',
                onTap: () {},
              ),
              const SizedBox(
                width: 25,
              ),
              CourseOptionsWidget(
                icon: Icons.star_outline,
                title: 'Favorites',
                onTap: () {},
              ),
              const SizedBox(
                width: 25,
              ),
              CourseOptionsWidget(
                icon: Icons.explore_outlined,
                title: 'Explore',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              CourseOptionsWidget(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {},
              ),
              const SizedBox(
                width: 25,
              ),
              CourseOptionsWidget(
                icon: Icons.warning_amber,
                title: 'Alerts',
                onTap: () {},
              ),
              const SizedBox(
                width: 25,
              ),
              CourseOptionsWidget(
                icon: Icons.lightbulb_outline,
                title: 'Tips',
                onTap: () {},
              ),
            ],
          ),
          const Spacer(),
          InkWell(
              onTap: () {},
              child: Container(
                width: 485,
                height: 75,
                child: const Center(
                  child: Text(
                    'Transfer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(color: primaryColor, boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 5,
                    color: primaryColor.withOpacity(0.1),
                  ),
                  BoxShadow(
                      offset: const Offset(0, -20),
                      spreadRadius: 10,
                      blurRadius: 25,
                      color: primaryColor.withOpacity(0.1)),
                  BoxShadow(
                      offset: const Offset(0, 50),
                      spreadRadius: 10,
                      blurRadius: 25,
                      color: primaryColor.withOpacity(0.2))
                ]),
              ))
        ],
      ),
    );
  }
}