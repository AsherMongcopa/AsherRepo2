import 'package:flutter/material.dart';
import 'package:task_manager_ui/ui/widgets/file_list_card/file_card.dart';
import 'package:task_manager_ui/ui/widgets/file_list_card/file_list_header.dart';

class FileListCard extends StatelessWidget {
  const FileListCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        FileListHeader(),
        FileCard(
          fileName: 'User flow.fig',
          date: 'Aug 5, 2021 at 9:50 AM',
          size: '0.6 KB',
          imgUrl: 'assets/icons/figma.png',
        ),
        FileCard(
          fileName: 'Design system.fig',
          date: 'Aug 5, 2021 at 9:20 AM',
          size: '0.8 KB',
          imgUrl: 'assets/icons/figma.png',
        ),
        FileCard(
          fileName: 'Animation.json',
          date: 'Aug 5, 2021 at 9:05 AM',
          size: '18 KB',
          imgUrl: 'assets/icons/json.png',
        ),
      ],
    );
  }
}
