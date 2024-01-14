import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/screens/chat_screen/detail_chat_screen.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';
import 'package:oracle_digital/presentation/widgets/custom_circle_avatar.dart';

class CustomChatMessage extends StatelessWidget {
  const CustomChatMessage({
    super.key,
    required this.name,
    required this.message,
    required this.avatar,
  });

  final String name;
  final String message;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatScreen(name: name),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 20,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 0,
              offset: Offset(0, -0.50),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x4C000000),
              blurRadius: 0,
              offset: Offset(0, 0.50),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: CustomCircleAvatator(
                  width: 64,
                  height: 64,
                  image: avatar,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppFonts.w700s13fRoboto,
                    ),
                    SizedBox(height: 6.h),
                      Flexible(
                        child: Text(
                          message,
                          style: AppFonts.w400s13fRoboto,
                          softWrap: true,
                        ),
                      ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
