import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_design/constants.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return BarChart(BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              maxY: 20,
              minY: 0,
              groupsSpace: 20,
              barTouchData: BarTouchData(enabled: true),
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (context, index) => const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                  margin: 40,
                  getTitles: (index) =>
                      GraphData.sampleData.elementAt(index.toInt()).id,
                ),
                leftTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
                topTitles: SideTitles(showTitles: false),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(
                  show: true,
                  border: Border(
                      top: BorderSide(width: 2, color: Colors.grey.shade300))),
              barGroups: List.generate(
                  GraphData.sampleData.length,
                  (index) => BarChartGroupData(x: index, barRods: [
                        BarChartRodData(
                            y: GraphData.sampleData[index].y,
                            width: (constraints.maxWidth /
                                    GraphData.sampleData.length) *
                                .75,
                            colors: [GraphData.sampleData[index].color],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ))
                      ]))));
        }),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 45),
          child: LineChart(LineChartData(
              maxY: 20,
              minY: 0,
              minX: 0,
              maxX: 11,
              lineTouchData: LineTouchData(enabled: true),
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(
                  showTitles: false,
                ),
                leftTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
                topTitles: SideTitles(showTitles: false),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  shadow: Shadow(
                      blurRadius: 10,
                      color: primaryColor.withOpacity(0.4),
                      offset: const Offset(0, 10)),
                  isCurved: true,
                  spots: List.generate(
                    GraphData.sampleLineBarData.length,
                    (index) => FlSpot(
                        index.toDouble(), GraphData.sampleLineBarData[index].y),
                  ),
                  colors: [primaryColor],
                  dotData: FlDotData(show: false),
                  barWidth: 5,
                )
              ])),
        ),
      ],
    );
  }
}

class GraphData {
  double y;
  String id;
  Color color;

  GraphData({
    required this.y,
    required this.id,
    required this.color,
  });

  static List<GraphData> get sampleData => [
        GraphData(y: 2, id: 'Jan', color: idleColor),
        GraphData(y: 7, id: 'Feb', color: idleColor),
        GraphData(y: 12, id: 'Mar', color: secondaryColor),
        GraphData(y: 4, id: 'Apr', color: idleColor),
        GraphData(y: 1, id: 'May', color: idleColor),
        GraphData(y: 6, id: 'Jun', color: idleColor),
        GraphData(y: 9, id: 'Jul', color: idleColor),
        GraphData(y: 11, id: 'Aug', color: primaryColor),
        GraphData(y: 7, id: 'Sep', color: idleColor),
        GraphData(y: 9, id: 'Oct', color: idleColor),
        GraphData(y: 8, id: 'Nov', color: idleColor),
        GraphData(y: 8, id: 'Dec', color: idleColor),
      ];

  static List<GraphData> get sampleLineBarData => [
        GraphData(y: 12, id: 'Jan', color: idleColor),
        GraphData(y: 12, id: 'Feb', color: idleColor),
        GraphData(y: 14, id: 'Mar', color: secondaryColor),
        GraphData(y: 12, id: 'Apr', color: idleColor),
        GraphData(y: 12, id: 'May', color: idleColor),
        GraphData(y: 13, id: 'Jun', color: idleColor),
        GraphData(y: 11, id: 'Jul', color: idleColor),
        GraphData(y: 14, id: 'Aug', color: primaryColor),
        GraphData(y: 14, id: 'Sep', color: idleColor),
        GraphData(y: 16, id: 'Oct', color: idleColor),
        GraphData(y: 13, id: 'Nov', color: idleColor),
        GraphData(y: 13, id: 'Dec', color: idleColor),
      ];
}
