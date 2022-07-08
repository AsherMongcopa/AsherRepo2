

import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: ThemeColor.main),
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: Icon(
            Icons.search,
            color: ThemeColor.main,
            size: 24,
          ),
          hintText: 'Search',
          fillColor: Colors.grey.shade200,
          filled: true,
          hintStyle: TextStyle(color: ThemeColor.main),
          contentPadding: const EdgeInsets.fromLTRB(0, 3.5, 12, 3),
          isDense: true),
    );
  }
}
