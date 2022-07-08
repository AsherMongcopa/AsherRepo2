import 'package:flutter/material.dart';
import 'package:task_manager_ui/ui/widgets/appbar/user_profile_circle.dart';
import 'package:task_manager_ui/ui/widgets/desktop_search_bar/search_bar_widget.dart';

class DesktopSearchBar extends StatelessWidget {
  const DesktopSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(right: 30),
          child: SearchBarWidget(),
        )),
        UserProfileCircle()
      ],
    );
  }
}
