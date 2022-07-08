import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/constant.dart';

class CustomDrawerTile extends StatelessWidget {
  const CustomDrawerTile({
    Key? key,
    this.isSelected = false,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final bool isSelected;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20),
      title: ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: isSelected ? kMainColor : Colors.white,
              primary: isSelected ? Colors.white : kMainColor,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)))),
          onPressed: () {
            if (isSelected) {
              return;
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
