import 'package:flutter/material.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFonts.w400s36fComfortaa,
    );
  }
}