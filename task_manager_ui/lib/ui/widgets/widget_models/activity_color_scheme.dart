import 'package:flutter/material.dart';
import 'package:task_manager_ui/constant.dart';

class ActivityColorScheme {
  Color cardColor;
  Color textColor;

  ActivityColorScheme({
    required this.cardColor,
    required this.textColor,
  });

  static ActivityColorScheme get colorScheme1 =>
      ActivityColorScheme(cardColor: ThemeColor.main, textColor: Colors.white);
  static ActivityColorScheme get colorScheme2 => ActivityColorScheme(
      cardColor: ThemeColor.secondary, textColor: ThemeColor.main);
  static ActivityColorScheme get colorScheme3 => ActivityColorScheme(
      cardColor: ThemeColor.secondary2, textColor: ThemeColor.main);
}
