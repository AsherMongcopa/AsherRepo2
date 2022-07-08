import 'package:flutter/material.dart';
import 'package:task_manager_ui/models/profile.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/activity_card.dart';
import 'package:task_manager_ui/ui/widgets/widget_models/activity_color_scheme.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityCard(
            title: 'Illustration Templates',
            subtitle: '9:00 AM - 4:00 PM',
            profileList: [
              Profile(id: '01', imgUrl: 'assets/images/avatar_01.jpeg'),
              Profile(id: '02', imgUrl: 'assets/images/avatar_02.jpeg'),
              Profile(id: '03', imgUrl: 'assets/images/avatar_03.jpeg')
            ],
            isCurrent: true,
            icon: Icons.palette),
        ActivityCard(
          title: 'UI Design',
          subtitle: '4:00 PM - 5:00 PM',
          profileList: [
            Profile(id: '01', imgUrl: 'assets/images/avatar_04.jpeg'),
            Profile(id: '02', imgUrl: 'assets/images/avatar_05.jpeg'),
          ],
          colorScheme: ActivityColorScheme.colorScheme2,
          icon: Icons.architecture,
        ),
        ActivityCard(
            title: 'UX Design',
            subtitle: '5:00 PM - 6:00 PM',
            profileList: [
              Profile(id: '01', imgUrl: 'assets/images/avatar_06.jpeg'),
              Profile(id: '02', imgUrl: 'assets/images/avatar_07.jpeg'),
              Profile(id: '03', imgUrl: 'assets/images/avatar_08.jpeg')
            ],
            colorScheme: ActivityColorScheme.colorScheme3,
            icon: Icons.layers),
      ],
    );
  }
}
