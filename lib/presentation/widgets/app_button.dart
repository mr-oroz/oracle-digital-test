import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.text,
    required this.width,
  });

  final Color color;
  final Function() onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 52.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: color == AppColor.white
              ? const BorderSide(width: 2, color: AppColor.black)
              : null,
          backgroundColor:
              color == AppColor.black ? AppColor.black : AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppFonts.w900s13fRoboto.copyWith(
            color: color == AppColor.white ? AppColor.black : AppColor.white,
          ),
        ),
      ),
    );
  }
}
