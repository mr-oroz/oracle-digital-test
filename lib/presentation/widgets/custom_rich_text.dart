import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oracle_digital/presentation/theme/app_fonts.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'By signing up, you agree to Photo’s ',
            style: AppFonts.w400s13fRoboto,
          ),
          TextSpan(
            text: 'Terms of Service',
            style: AppFonts.w400s13fRoboto.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Действие при нажатии, например, навигация
              },
          ),
          TextSpan(
            text: ' and ',
            style: AppFonts.w400s13fRoboto,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: AppFonts.w400s13fRoboto.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Действие при нажатии
              },
          ),
          TextSpan(
            text: '.',
            style: AppFonts.w400s13fRoboto,
          ),
        ],
      ),
    );
  }
}