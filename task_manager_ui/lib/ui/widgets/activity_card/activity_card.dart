import 'package:flutter/material.dart';

import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/models/profile.dart';
import 'package:task_manager_ui/ui/widgets/activity_card/profile_circle.dart';
import 'package:task_manager_ui/ui/widgets/components/responsive.dart';
import 'package:task_manager_ui/ui/widgets/widget_models/activity_color_scheme.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    this.colorScheme,
    required this.title,
    required this.subtitle,
    required this.profileList,
    this.isCurrent = false,
    required this.icon,
  }) : super(key: key);

  final ActivityColorScheme? colorScheme;
  final String title, subtitle;
  final List<Profile> profileList;
  final bool isCurrent;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Responsive(
        compact: Card(
          color: isCurrent
              ? ThemeColor.main
              : colorScheme?.cardColor ?? ThemeColor.main,
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  title,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(color: ThemeColor.idle3),
              ),
              textColor: isCurrent
                  ? Colors.white
                  : colorScheme?.textColor ?? Colors.white,
              trailing: SizedBox(
                width: 75,
                child: Stack(
                    children: List.generate(
                  profileList.length,
                  (index) => Positioned(
                    right: ((profileList.length - 1) - index) * 20,
                    bottom: 10,
                    child: ProfileCircle(
                      image: profileList[index].imgUrl,
                    ),
                  ),
                )),
              ),
            ),
          ),
        ),
        desktop: Card(
          color: isCurrent ? ThemeColor.main : Colors.white,
          elevation: isCurrent ? 0 : 7,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Center(
                        child: Icon(
                      icon,
                      size: 30,
                    )),
                    decoration: BoxDecoration(
                        color: isCurrent ? Colors.white : ThemeColor.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9))),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        title,
                      ),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: TextStyle(color: ThemeColor.idle3),
                    ),
                    textColor: isCurrent
                        ? Colors.white
                        : colorScheme?.textColor ?? Colors.white,
                    trailing: SizedBox(
                      width: 75,
                      child: Stack(
                          children: List.generate(
                        profileList.length,
                        (index) => Positioned(
                          right: ((profileList.length - 1) - index) * 20,
                          bottom: 10,
                          child: ProfileCircle(
                            image: profileList[index].imgUrl,
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
