import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 30, right: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search anything',
            hintStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade700,
              ),
            )),
      ),
    );
  }
}
