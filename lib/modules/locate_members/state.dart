import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocateMembersState {
  TextStyle? searchButtonTextStyle;
  TextStyle? postTileTextStyle;
  TextStyle? titleTextStyle;
  TextStyle? smallButtonTextStyle;
  LocateMembersState() {
    ///Initialize variables
    searchButtonTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white);
    postTileTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 16, color: customThemeColor);
    titleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black);
    smallButtonTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white);
  }
}
