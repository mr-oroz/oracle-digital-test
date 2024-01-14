import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';

class AppBackIconWidget extends StatelessWidget {
  const AppBackIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/back.svg',
      colorFilter: const ColorFilter.mode(AppColor.black,BlendMode.srcIn),
      width: 12.21.w,
      height: 11.4.h,
    );
  }
}