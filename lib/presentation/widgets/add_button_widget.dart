import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 70.w,
        height: 40.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.38, -0.93),
            end: Alignment(0.38, 0.93),
            colors: [Color(0xFFFF00D6), Color(0xFFFF4C00)],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}