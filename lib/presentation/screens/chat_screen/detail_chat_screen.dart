import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/core/data.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';
import 'package:oracle_digital/presentation/widgets/custom_chat_detail_message.dart';

class DetailChatScreen extends StatelessWidget {
  const DetailChatScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: AppFonts.w600s37fSfProText,
        ),
        elevation: .5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 22,
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 34.h),
               // тут я создал class и локальный model я сам определил пока что ручной тип логичечкий isReversed если false он сам или сама если true этот клиентский чат будет можете проверить на emulator
              ...messageDetail.map((item) {
                return CustomChatDetailMessage(
                  message: item.message,
                  avatar: item.avatar,
                  isReversed: item.isReversed,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}


