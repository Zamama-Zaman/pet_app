import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagsState {
  TextStyle? titleTextStyle;
  TextStyle? dateTimeTextStyle;
  TextStyle? subTitleTextStyle;
  TextStyle? messageTextTextStyle;
  MessagsState() {
    ///Initialize variables
    titleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black);
    dateTimeTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: const Color(0xff979797));
    subTitleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: const Color(0xff979797));
    messageTextTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white);
  }
}
