import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({Key? key, required this.compact, required this.desktop})
      : super(key: key);

  final Widget compact, desktop;

  static int get _mobileCompactMaxSize => 570;
  static int get _mobileMaxSize => 760;
  static int get _tabletMaxSize => 1200;

  static bool isMobileCompact(BuildContext context) =>
      MediaQuery.of(context).size.width <= _mobileCompactMaxSize;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= _mobileMaxSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width <= _tabletMaxSize &&
      MediaQuery.of(context).size.width > _mobileMaxSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > _tabletMaxSize;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: ((context) {
      if (MediaQuery.of(context).size.width > _tabletMaxSize) {
        return desktop;
      } else {
        return compact;
      }
    }));
  }
}
