import 'package:flutter/material.dart';
import 'package:flutter_ui_design/ui/widgets/appBarWidget/components/app_bar_button_widget.dart';
import 'package:flutter_ui_design/ui/widgets/appBarWidget/components/main_profile_button_widget.dart';
import 'package:flutter_ui_design/ui/widgets/appBarWidget/components/search_bar.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
      child: Row(
        children: [
          // menu button
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          // search bar
          const Expanded(
            child: SearchBar(),
          ),
          // messages button
          AppBarButtonWidget(
            icon: Icons.chat_outlined,
            onTap: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          // notif button with update
          AppBarButtonWidget(
            icon: Icons.notifications_outlined,
            onTap: () {},
            hasNotification: true,
          ),
          const SizedBox(
            width: 30,
          ),
          // profile button
          MainProfileButtonWidget(
              imgLocation: 'assets/images/mainprofile.jpeg', onTap: () {})
        ],
      ),
    );
  }
}
