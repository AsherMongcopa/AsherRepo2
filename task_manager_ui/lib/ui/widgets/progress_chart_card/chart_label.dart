import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class ChartLabel extends StatelessWidget {
  const ChartLabel({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.labelColor,
  }) : super(key: key);

  final String title, subtitle;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.all(5),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: labelColor),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    title,
                    style: TextStyle(color: ThemeColor.main),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: ThemeColor.idle2, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
