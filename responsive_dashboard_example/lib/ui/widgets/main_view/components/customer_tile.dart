

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';

class CustomerTile extends StatelessWidget {
  const CustomerTile({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onProfileClick,
    required this.onChatClick,
    required this.onCallClick,
  }) : super(key: key);

  final ImageProvider<Object> image;
  final String title, subtitle;
  final Function onProfileClick, onChatClick, onCallClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            shape: BoxShape.circle, image: DecorationImage(image: image)),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () => onProfileClick(),
              icon: const Icon(
                Icons.account_circle_outlined,
                color: kMainColor,
              )),
          IconButton(
              onPressed: () => onChatClick(),
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: kMainColor,
              )),
          IconButton(
              onPressed: () => onCallClick(),
              icon: const Icon(
                Icons.call_outlined,
                color: kMainColor,
              )),
        ],
      ),
    );
  }

  static CustomerTile get sampleCustomer => CustomerTile(
      image: const AssetImage('assets/user.jpeg'),
      title: 'Lewis S. Cunningham',
      subtitle: 'CEO Excerpt',
      onProfileClick: () {},
      onChatClick: () {},
      onCallClick: () {});
}