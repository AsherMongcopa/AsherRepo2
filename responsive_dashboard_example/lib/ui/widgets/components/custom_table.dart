import 'package:flutter/material.dart';

class CustomTableWidget extends StatelessWidget {
  const CustomTableWidget({
    Key? key,
    required this.column,
    required this.rows,
  }) : super(key: key);

  final List<CustomTableColumn> column;
  final List<CustomTableRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: List.generate(
              column.length,
              (index) => Expanded(
                  flex: column[index].flex,
                  child: Text(column[index].label,
                      style: const TextStyle(fontWeight: FontWeight.bold))),
            ),
          ),
        ),
        const Divider(),
        ...List.generate(
          rows.length,
          (index) => Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                if (rows[index].cells.length == column.length)
                  ...List.generate(
                      rows[index].cells.length,
                      (cellIndex) => Expanded(
                          flex: column[cellIndex].flex,
                          child: rows[index].cells[cellIndex].child)),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CustomTableColumn {
  int flex;
  String label;

  CustomTableColumn({
    this.flex = 1,
    required this.label,
  });
}

class CustomTableRow {
  List<CustomTableCell> cells;

  CustomTableRow({
    required this.cells,
  });
}

class CustomTableCell {
  Widget child;

  CustomTableCell({
    required this.child,
  });
}

class Status extends StatelessWidget {
  const Status({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 10, top: 4),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        Text(text),
      ],
    );
  }

  static Status get review =>
      const Status(color: Colors.indigo, text: 'review');
  static Status get inProgress =>
      const Status(color: Colors.pink, text: 'in progress');
  static Status get pending =>
      const Status(color: Colors.orange, text: 'pending');
}
