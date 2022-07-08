import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class CourseButtonWidget extends StatelessWidget {
  const CourseButtonWidget({
    Key? key,
    required this.imgLocation,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final String imgLocation;
  final String title;
  final String subtitle;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              width: 230,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imgLocation))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Text(
                      title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(color: textColor, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      subtitle,
                      style: const TextStyle(color: textColor, fontSize: 10),
                    ),
                  ),
                ],
              ),
              decoration: const BoxDecoration(color: Colors.white),
            ),
            Container(
              width: 230,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text('Learn More',
                          style: TextStyle(
                              color: isSelected ? Colors.white : textColor,
                              fontSize: 13)),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.info_outline,
                      size: 15,
                      color: isSelected ? Colors.white : textColor,
                    )
                  ],
                ),
              ),
              decoration:
                  BoxDecoration(color: isSelected ? primaryColor : idleColor),
            )
          ],
        ),
        decoration: BoxDecoration(
            border:
                isSelected ? Border.all(width: 1, color: primaryColor) : null,
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  color: isSelected ? primaryColor : Colors.grey),
              BoxShadow(
                  blurRadius: 5.5,
                  offset: const Offset(5, 15),
                  color: isSelected
                      ? primaryColor.withOpacity(0.08)
                      : Colors.grey.withOpacity(0.08))
            ]),
      ),
    );
  }
}
