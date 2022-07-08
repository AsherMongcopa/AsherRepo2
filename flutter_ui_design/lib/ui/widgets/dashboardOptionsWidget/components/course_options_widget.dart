import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class CourseOptionsWidget extends StatelessWidget {
  const CourseOptionsWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        height: 150,
        width: 145,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          const BoxShadow(blurRadius: 1, color: Colors.grey),
          BoxShadow(
              blurRadius: 4,
              offset: const Offset(5, 10),
              color: Colors.grey.withOpacity(0.1))
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: 28,
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              style: const TextStyle(color: textColor, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
