import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class MainProfileButtonWidget extends StatelessWidget {
  const MainProfileButtonWidget({
    Key? key,
    required this.imgLocation,
    required this.onTap,
  }) : super(key: key);

  final String imgLocation;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imgLocation)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                blurRadius: 5,
                color: primaryColor.withOpacity(0.1),
              ),
              BoxShadow(
                  offset: const Offset(0, 35),
                  blurRadius: 15,
                  color: primaryColor.withOpacity(0.1))
            ]),
      ),
    );
  }
}
