import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oracle_digital/presentation/core/data.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';
import 'package:oracle_digital/presentation/widgets/custom_chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
     bool get wantKeepAlive => true; // Важно!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 11.h),
            Center(
              child: Text(
                'Chats',
                style: AppFonts.w600s37fSfProText,
              ),
            ),
            SizedBox(height: 11.h),
            // тут я создал class и локальный model я сам определил пока что ручной
            ...messages.map((item) {
              return  CustomChatMessage(
                name: item.name,
                message: item.message,
                avatar: item.image,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
