import 'package:flutter/material.dart';
import 'package:flutter_ui_design/ui/widgets/courseListWidget/components/course_button_widget.dart';

class CourseListWidget extends StatelessWidget {
  const CourseListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 35, 35, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
              multipleSampleButtons.length,
              (index) => Padding(
                    padding: EdgeInsets.only(right: index < multipleSampleButtons.length ? 35 : 0),
                    child: multipleSampleButtons[index],
                  )),
        ),
      ),
    );
  }

  List<Widget> get multipleSampleButtons => [
        ...sampleCourseButtons,
        ...sampleCourseButtons,
        ...sampleCourseButtons,
      ];

  List<Widget> get sampleCourseButtons => [
        CourseButtonWidget(
          imgLocation: 'assets/images/phpLogo.png',
          title: 'PHP Developer',
          subtitle: '124 Videos',
          onTap: () {},
        ),
        CourseButtonWidget(
          imgLocation: 'assets/images/pythonLogo.png',
          title: 'Python Programming',
          subtitle: '236 Videos',
          onTap: () {},
          isSelected: true,
        ),
        CourseButtonWidget(
          imgLocation: 'assets/images/figmaLogo.png',
          title: 'Figma Design',
          subtitle: '87 Videos',
          onTap: () {},
        ),
        CourseButtonWidget(
          imgLocation: 'assets/images/sketchLogo.png',
          title: 'UI with Sketch',
          subtitle: '29 Videos',
          onTap: () {},
        ),
        CourseButtonWidget(
          imgLocation: 'assets/images/grunttLogo.png',
          title: 'Gruntt',
          subtitle: '18 Videos',
          onTap: () {},
        ),
      ];
}
