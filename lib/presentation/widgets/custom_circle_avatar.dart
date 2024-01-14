import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatator extends StatelessWidget {
  const CustomCircleAvatator({
    super.key,
    required this.width,
    required this.height,
    required this.image,
  });

  final double width;
  final double height;

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width.h,
      width: height.w,
      child: CircleAvatar(
        child: ClipOval(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}