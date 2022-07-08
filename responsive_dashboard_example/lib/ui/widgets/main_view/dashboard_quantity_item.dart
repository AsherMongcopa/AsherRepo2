import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';

class DashboardQuantityItem extends StatelessWidget {
  const DashboardQuantityItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.type,
    this.isHighlighted = false,
  }) : super(key: key);

  final IconData icon;
  final String value;
  final String type;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      color: isHighlighted ? kMainColor : Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: isHighlighted ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  type,
                  style: TextStyle(
                      color: isHighlighted ? Colors.white : Colors.grey),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(18.0),
            child: Icon(
              icon,
              color: isHighlighted ? Colors.white : kMainColor,
              size: 48,
            ),
          ),
        ],
      ),
    );
  }
}