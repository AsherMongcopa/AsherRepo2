import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/components/responsive.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          startDegreeOffset: 270,
          sections: [
            PieChartSectionData(
                value: 35,
                color: ThemeColor.accent,
                title: '35%',
                titleStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            PieChartSectionData(
                value: 65,
                color: ThemeColor.accent2,
                title: '65%',
                titleStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))
          ],
          centerSpaceRadius: Responsive.isDesktop(context) ? 60 : 40),
    );
  }
}
