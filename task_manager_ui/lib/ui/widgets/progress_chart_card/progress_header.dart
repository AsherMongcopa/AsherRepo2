import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';
import 'package:task_manager_ui/ui/widgets/components/responsive.dart';

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Progress',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: ThemeColor.main),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Illustration Template',
              style: TextStyle(
                  color: Responsive.isDesktop(context)
                      ? ThemeColor.main
                      : ThemeColor.idle2),
            ),
          ),
          const Spacer(),
          Container(
            width: 15,
            height: 15,
            child: const Icon(
              Icons.download,
              color: Colors.white,
              size: 10,
            ),
            decoration: BoxDecoration(
                color: ThemeColor.main,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
          ),
          const SizedBox(width: 12),
          Container(
            width: 15,
            height: 15,
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 10,
            ),
            decoration: BoxDecoration(
                color: ThemeColor.main,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
          )
        ],
      ),
    );
  }
}
