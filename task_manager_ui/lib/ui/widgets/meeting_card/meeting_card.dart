import 'package:flutter/material.dart';

import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/models/meeting.dart';
import 'package:task_manager_ui/ui/widgets/meeting_card/meeting_header.dart';
import 'package:task_manager_ui/ui/widgets/meeting_card/meeting_widget.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeetingHeader(onDatePressed: () {}),
        Card(
          elevation: 0,
          color: ThemeColor.secondary2,
          shape: const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      meetingSampleList.length,
                      (index) => MeetingWidget(
                        currentDay: currentDay,
                        dayOfWeek: meetingSampleList[index].dayOfWeek,
                        day: meetingSampleList[index].day,
                        time1: meetingSampleList[index].time1,
                        time2: meetingSampleList[index].time2,
                        time3: meetingSampleList[index].time3,
                      ),
                    )),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 45,
        )
      ],
    );
  }

  String get currentDay => '6';

  List<Meeting> get meetingSampleList => [
        Meeting(
            dayOfWeek: 'Mon',
            day: '3',
            time1: '9:00 AM',
            time2: '2:00 PM',
            time3: '4:00 PM'),
        Meeting(
            dayOfWeek: 'Tue',
            day: '4',
            time1: '10:30AM',
            time2: '1:00 PM',
            time3: '---'),
        Meeting(
            dayOfWeek: 'Wed',
            day: '5',
            time1: '9:00 AM',
            time2: '3:00 PM',
            time3: '6:00 PM'),
        Meeting(
            dayOfWeek: 'Thu',
            day: '6',
            time1: '11:00 AM',
            time2: '---',
            time3: '3:50 PM'),
        Meeting(
            dayOfWeek: 'Fri',
            day: '7 ',
            time1: '9:20 AM',
            time2: '1:15 PM',
            time3: '5:45 PM'),
      ];
}
