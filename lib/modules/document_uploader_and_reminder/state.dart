import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentUploaderAndReminderState {
  TextStyle? nameTextStyle;
  TextStyle? smallButtonTextStyle;
  TextStyle? buttonTextStyle;
  DocumentUploaderAndReminderState() {
    ///Initialize variables
    nameTextStyle = GoogleFonts.jost(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);
    smallButtonTextStyle = GoogleFonts.jost(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);
    buttonTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18);
  }
}
