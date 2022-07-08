import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key? key,
    required this.itemsPerRow,
    required this.children,
  }) : super(key: key);

  final int itemsPerRow;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: List.generate(
            _columnsLength,
            (colIndex) => Row(
                  children: List.generate(
                      itemsPerRow,
                      (rowIndex) =>
                          (colIndex * itemsPerRow) + rowIndex >= children.length
                              ? Expanded(
                                  flex: 1,
                                  child: Container(),
                                )
                              : Expanded(
                                  child: children[
                                      (colIndex * itemsPerRow) + rowIndex])),
                )),
      );
    });
  }

  int get _columnsLength {
    return children.length.remainder(itemsPerRow) > 0
        ? (children.length / itemsPerRow).truncate() + 1
        : (children.length / itemsPerRow).truncate();
  }
}
