import 'package:flutter/material.dart';
import 'package:flutter_ui_design/ui/widgets/navigationRail/components/add_person_button_widget.dart';
import 'package:flutter_ui_design/ui/widgets/navigationRail/components/main_logo_widget.dart';
import 'package:flutter_ui_design/ui/widgets/navigationRail/components/navigation_rail_button_widget.dart';
import 'package:flutter_ui_design/ui/widgets/navigationRail/components/profile_button.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // circle logo
              const MainLogoWidget(),
              const SizedBox(
                height: 50,
              ),
              // home button
              NavigationRailButtonWidget(
                icon: Icons.home_outlined,
                isSelected: true,
                onTap: () {},
              ),
              // categ button
              NavigationRailButtonWidget(
                icon: Icons.dashboard_outlined,
                isSelected: false,
                onTap: () {},
              ),
              // work button with update
              NavigationRailButtonWidget(
                icon: Icons.category_outlined,
                isSelected: false,
                hasNotification: true,
                onTap: () {},
              ),
              // rocket button
              NavigationRailButtonWidget(
                icon: Icons.catching_pokemon,
                isSelected: false,
                onTap: () {},
              ),
              // settings button
              NavigationRailButtonWidget(
                icon: Icons.settings_outlined,
                isSelected: false,
                onTap: () {},
              ),
              const Spacer(),
              // chat person with update
              const ProfileButton(
                imgLocation: 'assets/images/friend1.jpeg',
                hasNotification: true,
              ),
              //chat person
              const ProfileButton(
                imgLocation: 'assets/images/friend2.jpeg',
              ),
              //add friend
              AddPersonButtonWidget(onTap: () {}, isSelected: false)
            ],
          ),
        ),
        // custom divider
        Container(
            width: 1, height: double.infinity, color: Colors.grey.shade300),
      ],
    );
  }
}
