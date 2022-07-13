import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileState {
  TextStyle? changePicTextStyle;
  TextStyle? labelTextStyle;
  TextStyle? buttonTextStyle;
  UserProfileState() {
    ///Initialize variables
    changePicTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 12, color: customThemeColor);
    labelTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black);
    buttonTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white);
  }
}
