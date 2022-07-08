

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    Key? key,
    required this.title,
    required this.onPressedSeeAllButton,
  }) : super(key: key);

  final String title;
  final Function onPressedSeeAllButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kMainColor),
              onPressed: () => onPressedSeeAllButton(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('See all'),
                  Padding(
                    padding: EdgeInsets.only(top: 2, left: 3),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 14,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}