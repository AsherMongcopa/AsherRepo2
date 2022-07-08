import 'package:flutter/material.dart';
import 'package:flutter_ui_design/ui/widgets/chartContainerWidget/components/graph_header_widget.dart';
import 'package:flutter_ui_design/ui/widgets/graphWidget/graph_widget.dart';

class ChartContainerWidget extends StatelessWidget {
  const ChartContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      // width: 755,
      padding: const EdgeInsets.fromLTRB(35, 20, 35, 35),
      child: Column(
        children: const [
          GraphHeaderWidget(),
          SizedBox(height: 20,),
          Expanded(child: GraphWidget())
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        const BoxShadow(blurRadius: 1, color: Colors.grey),
        BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 10),
            color: Colors.grey.withOpacity(0.1))
      ]),
    );
  }
}
