import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/components/responsive.dart';
import 'package:task_manager_ui/ui/widgets/progress_chart_card/chart_label.dart';
import 'package:task_manager_ui/ui/widgets/progress_chart_card/graph_widget.dart';

class ChartContent extends StatelessWidget {
  const ChartContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Responsive.isDesktop(context) ? 200 : 150,
            height: Responsive.isDesktop(context) ? 200 : 150,
            child: const GraphWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChartLabel(
                  title: 'Cartoon Illustration',
                  subtitle: 'Illustration Template',
                  labelColor: ThemeColor.accent,
                ),
                ChartLabel(
                  title: 'Abstract Pattern',
                  subtitle: 'Geometric Shapes',
                  labelColor: ThemeColor.accent2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
