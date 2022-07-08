

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_example/ui/widgets/components/responsive.dart';
import 'package:responsive_dashboard_example/ui/widgets/main_view/components/card_title.dart';
import 'package:responsive_dashboard_example/ui/widgets/components/custom_table.dart';

class ProjectsTable extends StatelessWidget {
  const ProjectsTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CardTitle(
            title: 'Recent Projects',
            onPressedSeeAllButton: () {},
          ),
          const Divider(),
          CustomTableWidget(column: [
            CustomTableColumn(
              flex: Responsive.isMobileCompact(context) ? 1 : 3,
              label: 'Project Title',
            ),
            CustomTableColumn(
              flex: Responsive.isMobileCompact(context) ? 1 : 2,
              label: 'Department',
            ),
            CustomTableColumn(
              flex: Responsive.isMobileCompact(context) ? 1 : 2,
              label: 'Status',
            ),
          ], rows: [
            ...sampleData,
            ...sampleData,
            ...sampleData,
          ])
        ],
      ),
    );
  }

  List<CustomTableRow> get sampleData => [
        CustomTableRow(cells: [
          CustomTableCell(child: const Text('UI/UX Design')),
          CustomTableCell(child: const Text('UI Team')),
          CustomTableCell(child: Status.review)
        ]),
        CustomTableRow(cells: [
          CustomTableCell(child: const Text('Web development')),
          CustomTableCell(child: const Text('Frontend')),
          CustomTableCell(child: Status.inProgress)
        ]),
        CustomTableRow(cells: [
          CustomTableCell(child: const Text('Ushop app')),
          CustomTableCell(child: const Text('Mobile Team')),
          CustomTableCell(child: Status.pending)
        ]),
      ];
}