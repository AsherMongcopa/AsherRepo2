
import 'package:flutter/material.dart';

class MobileSearchButton extends StatelessWidget {
  const MobileSearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
        splashRadius: 20,
      ),
    );
  }
}
