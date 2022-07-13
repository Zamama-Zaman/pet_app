import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsState {
  TextStyle? titleTextStyle;
  SettingsState() {
    ///Initialize variables
    titleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 18, color: customThemeColor);
  }
}
