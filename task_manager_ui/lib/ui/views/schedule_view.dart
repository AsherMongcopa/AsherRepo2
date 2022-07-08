import 'package:flutter/material.dart';

import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/activity_list.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/calendar_dialog.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/calendar_widget.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/custom_tab_bar.dart';
import 'package:task_manager_ui/ui/widgets/appbar/mobile_search_button.dart';
import 'package:task_manager_ui/ui/widgets/appbar/user_profile_circle.dart';
import 'package:task_manager_ui/ui/widgets/components/responsive.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/schedule_header_widget.dart';
import 'package:task_manager_ui/ui/widgets/desktop_search_bar/desktop_search_bar.dart';
import 'package:task_manager_ui/ui/widgets/drawer/full_drawer.dart';
import 'package:task_manager_ui/ui/widgets/drawer/mobile_drawer.dart';
import 'package:task_manager_ui/ui/widgets/file_list_card/file_list_card.dart';
import 'package:task_manager_ui/ui/widgets/meeting_card/meeting_card.dart';
import 'package:task_manager_ui/ui/widgets/progress_chart_card/chart_card.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    // print(MediaQuery.of(context).size.width);

    return Scaffold(
      key: _scaffoldKey,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              backgroundColor: Colors.white,
              foregroundColor: ThemeColor.main,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu),
                splashRadius: 20,
              ),
              actions: const [MobileSearchButton(), UserProfileCircle()],
            )
          : null,
      drawer: Responsive.isMobile(context) ? const MobileDrawer() : null,
      backgroundColor: Colors.white,
      body: Row(
        children: [
          if (!Responsive.isMobile(context)) const FullDrawer(),
          Expanded(
            child: Column(
              children: [
                if (Responsive.isTablet(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: const [
                        Spacer(),
                        MobileSearchButton(),
                        UserProfileCircle()
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView(
                    children: [
                      Responsive(
                          compact: Padding(
                            padding: !Responsive.isMobileCompact(context)
                                ? const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20)
                                : EdgeInsets.zero,
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  return ScheduleHeaderWidget(
                                    onDatePressed: () {
                                      if (Responsive.isMobile(context)) {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) => Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  alignment:
                                                      WrapAlignment.center,
                                                  children: const [
                                                    SizedBox(
                                                      width: 350,
                                                      child: CalendarWidget(),
                                                    ),
                                                  ],
                                                ));
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const CalendarDialog(),
                                        );
                                      }
                                    },
                                  );
                                }),
                                const CustomTabBar(),
                                const ActivityList(),
                                const ChartCard(),
                                const FileListCard(),
                              ],
                            ),
                          ),
                          desktop: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: !Responsive.isMobileCompact(context)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 20)
                                      : EdgeInsets.zero,
                                  child: Column(
                                    children: [
                                      Builder(builder: (context) {
                                        return ScheduleHeaderWidget(
                                          onDatePressed: () {
                                            if (Responsive.isMobile(context)) {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) => Wrap(
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .center,
                                                        alignment: WrapAlignment
                                                            .center,
                                                        children: const [
                                                          SizedBox(
                                                            width: 350,
                                                            child:
                                                                CalendarWidget(),
                                                          ),
                                                        ],
                                                      ));
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const CalendarDialog(),
                                              );
                                            }
                                          },
                                        );
                                      }),
                                      const CustomTabBar(),
                                      const ActivityList(),
                                      const ChartCard(),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: !Responsive.isMobileCompact(context)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 20)
                                      : EdgeInsets.zero,
                                  child: Column(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 13),
                                        child: DesktopSearchBar(),
                                      ),
                                      MeetingCard(),
                                      FileListCard(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
