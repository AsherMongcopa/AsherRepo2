import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class AddPersonButtonWidget extends StatelessWidget {
  const AddPersonButtonWidget({
    Key? key,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final Function onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: SizedBox(
        width: 80,
        height: 75,
        child: Center(
          child: Stack(
            children: [
              Icon(
                Icons.person_add,
                color: isSelected ? primaryColor : Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
