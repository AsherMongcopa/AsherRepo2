import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class DashboardTitleWidget extends StatelessWidget {
  const DashboardTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Learn New Skills',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'One Simple Price, Unlimited Skills',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            )
          ]),
          const Spacer(),
          InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 2, right: 12),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    Text(
                      'Explore More',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}
