import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesState {
  TextStyle? postTileTextStyle;
  TextStyle? postLikeBarTextStyle;
  TextStyle? commentUserTitleTextStyle;
  TextStyle? commentUserSubTitleTextStyle;
  TextStyle? commentTextStyle;

  ActivitiesState() {
    ///Initialize variables
    postTileTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 16, color: customThemeColor);
    postLikeBarTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black);

    commentUserTitleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16);
    commentUserSubTitleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400,
        color: Colors.black.withOpacity(0.3),
        fontSize: 12);
    commentTextStyle =
        GoogleFonts.jost(fontWeight: FontWeight.w400, fontSize: 16);
  }
}
