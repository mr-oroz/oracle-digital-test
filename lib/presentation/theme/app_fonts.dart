import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oracle_digital/presentation/theme/app_colors.dart';

abstract class AppFonts {
  static TextStyle w900s13fRoboto = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w900,
    color: AppColor.black,
  );
  static TextStyle w700s13fRoboto = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );
  static TextStyle w400s36fComfortaa = GoogleFonts.comfortaa(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static TextStyle w600s37fSfProText = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: "SFProText",
    color: AppColor.black,
  );
  static TextStyle w400s15fRoboto = GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static TextStyle w400s13fRoboto = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
  static TextStyle w400s11fRoboto = GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
  );
}
