import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class GraphHeaderWidget extends StatelessWidget {
  const GraphHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Learning Curve',
            style: TextStyle(color: textColor, fontSize: 28),
          ),
        ),
        const Spacer(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Compare with',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(
              width: 100,
              child: DropdownButtonFormField(
                value: 0,
                items: const [
                  DropdownMenuItem(
                    child: Text('Last Month',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11)),
                    value: 0,
                  )
                ],
                onChanged: (val) {},
                decoration: const InputDecoration(
                    border: InputBorder.none, isDense: true),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Change',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                '+12%',
                style: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }
}
