import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';

class PersonInfoWidget extends StatelessWidget {
  const PersonInfoWidget({
    super.key,
    required this.avavar,
    required this.name,
    required this.social, required this.color,
  });

  final String avavar;
  final String name;
  final String social;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28.w,
          height: 28.h,
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                avavar,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppFonts.w700s13fRoboto.copyWith(color: color),
            ),
            Text(
              '@$social',
              style: AppFonts.w400s11fRoboto.copyWith(color: color),
            ),
          ],
        ),
      ],
    );
  }
}