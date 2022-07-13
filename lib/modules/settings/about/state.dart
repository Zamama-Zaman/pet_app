import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutState {
  TextStyle? titleTextStyle;
  TextStyle? valueTextStyle;
  AboutState() {
    ///Initialize variables
    titleTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black);
    valueTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black);
  }
}
