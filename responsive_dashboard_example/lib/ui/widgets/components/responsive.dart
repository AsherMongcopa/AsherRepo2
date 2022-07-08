import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  //mobile == <=560
  //tablet == >560 && <=780
  //desktop == >780

  final Widget mobile, desktop;

  static int get _mobileCompactMaxSize => 420;
  static int get _mobileMaxSize => 560;
  static int get _tabletMaxSize => 764;
  static int get _desktopSmallMaxSize => 962;


  static bool isMobileCompact(BuildContext context) =>
      MediaQuery.of(context).size.width <= _mobileCompactMaxSize;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= _mobileMaxSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= _tabletMaxSize &&
      MediaQuery.of(context).size.width > _mobileMaxSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > _tabletMaxSize;

  static bool isDesktopLarge(BuildContext context) =>
      MediaQuery.of(context).size.width > _desktopSmallMaxSize;

  static bool isDesktopSmall(BuildContext context) =>
      MediaQuery.of(context).size.width <= _desktopSmallMaxSize &&
      MediaQuery.of(context).size.width > _tabletMaxSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth > _tabletMaxSize) {
          return desktop;
        } else {
          return mobile;
        }
      }),
    );
  }
}
