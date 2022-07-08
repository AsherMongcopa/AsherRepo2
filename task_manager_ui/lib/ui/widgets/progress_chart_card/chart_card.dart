import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/components/responsive.dart';
import 'package:task_manager_ui/ui/widgets/progress_chart_card/chart_content.dart';
import 'package:task_manager_ui/ui/widgets/progress_chart_card/progress_header.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      compact: Column(
        children: const [
          ProgressHeader(),
          ChartContent(),
        ],
      ),
      desktop: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 5),
            child: Row(
              children: [
                Text(
                  'Project Progress',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: ThemeColor.main),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: ThemeColor.main,
                  ),
                  splashRadius: 20,
                )
              ],
            ),
          ),
          Card(
            elevation: 0,
            color: Colors.grey.shade200,
            child: Column(
              children: const [
                ProgressHeader(),
                ChartContent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
