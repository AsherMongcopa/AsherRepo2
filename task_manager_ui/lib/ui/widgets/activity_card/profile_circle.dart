
import 'package:flutter/material.dart';
class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(image), isAntiAlias: true)),
    );
  }
}
