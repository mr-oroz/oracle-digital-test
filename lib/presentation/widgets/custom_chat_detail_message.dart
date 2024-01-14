import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';

class CustomChatDetailMessage extends StatelessWidget {
  const CustomChatDetailMessage({
    super.key,
    required this.message,
    required this.avatar,
    required this.isReversed,
  });

  final String message;
  final String avatar;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isReversed
            ? buildMessageProfile
            : buildMessageProfile.reversed.toList(),
      ),
    );
  }
  List<Widget> get buildMessageProfile {
    return [
      Expanded(
        flex: 1,
        child: SizedBox(
          height: 28.h,
          width: 28.w,
          child: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                avatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 16.h),
      Expanded(
        flex: 4,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.029999999329447746),
            borderRadius: isReversed
                ? const BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
          ),
          child: Text(
            message,
            style: AppFonts.w400s13fRoboto.copyWith(height: 1.3),
          ),
        ),
      ),
    ];
  }
}