import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/components/responsive.dart';

class FileCard extends StatelessWidget {
  const FileCard({
    Key? key,
    required this.fileName,
    required this.date,
    required this.size,
    required this.imgUrl,
  }) : super(key: key);

  final String fileName, date, size, imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: Responsive.isDesktop(context)
          ? RoundedRectangleBorder(
              side: BorderSide(color: ThemeColor.main, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(12)))
          : null,
      child: ListTile(
        contentPadding:
            Responsive.isDesktop(context) ? const EdgeInsets.all(20) : null,
        title: Padding(
          padding: Responsive.isDesktop(context)
              ? const EdgeInsets.only(bottom: 7)
              : EdgeInsets.zero,
          child: Text(
            fileName,
            style: TextStyle(color: ThemeColor.main),
          ),
        ),
        subtitle: Text(
          date,
          style: TextStyle(color: ThemeColor.idle2, fontSize: 12),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Container(
            width: Responsive.isDesktop(context) ? 50 : 40,
            height: Responsive.isDesktop(context) ? 50 : 40,
            child: Center(
                child: SizedBox(
                    height: 16,
                    width: 16,
                    child: Image.asset(
                      imgUrl,
                      isAntiAlias: true,
                    ))),
            decoration: BoxDecoration(
                color: ThemeColor.main,
                borderRadius: const BorderRadius.all(Radius.circular(7))),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                size,
                style: TextStyle(color: ThemeColor.idle2, fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: IconButton(
                  onPressed: () {},
                  iconSize: 15,
                  splashRadius: 14,
                  icon: Icon(
                    Icons.download,
                    color: ThemeColor.main,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
