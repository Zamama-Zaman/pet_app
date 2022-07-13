import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeState {
  TextStyle? searchBarTextStyle;
  TextStyle? postTileTextStyle;
  TextStyle? postLikeBarTextStyle;
  TextStyle? drawerHeadingTextStyle;
  TextStyle? drawerTitleTextStyle;
  TextStyle? hintTextStyle;
  TextStyle? buttonTextStyle;
  TextStyle? commentUserTitleTextStyle;
  TextStyle? commentUserSubTitleTextStyle;
  TextStyle? commentTextStyle;

  HomeState() {
    ///Initialize variables
    searchBarTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black.withOpacity(0.2));
    postTileTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 16, color: customThemeColor);
    postLikeBarTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black);
    drawerHeadingTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 24, color: Colors.white);
    drawerTitleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white);
    hintTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black.withOpacity(0.2));

    buttonTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18);
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
