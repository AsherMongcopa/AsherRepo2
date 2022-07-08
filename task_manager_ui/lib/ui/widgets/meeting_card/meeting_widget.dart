import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/meeting_card/time_widget.dart';

class MeetingWidget extends StatelessWidget {
  const MeetingWidget({
    Key? key,
    required this.currentDay,
    required this.dayOfWeek,
    required this.day,
    required this.time1,
    required this.time2,
    required this.time3,
  }) : super(key: key);

  final String currentDay;
  final String dayOfWeek;
  final String day;
  final String time1;
  final String time2;
  final String time3;

  bool get isCurrentDay => day == currentDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: isCurrentDay
            ? RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                side: BorderSide(color: ThemeColor.main, width: 3))
            : null,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: isCurrentDay ? Colors.transparent : ThemeColor.secondary,
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(dayOfWeek),
                        ),
                        Text(
                          day,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              TimeWidget(text: time1),
              TimeWidget(text: time2),
              TimeWidget(text: time3),
            ],
          ),
        ),
      ),
    );
  }
}
