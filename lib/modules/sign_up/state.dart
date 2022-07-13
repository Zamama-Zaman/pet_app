import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpState {
  TextStyle? headingTextStyle;
  TextStyle? signUpTextStyle;
  SignUpState() {
    ///Initialize variables
    headingTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 32);
    signUpTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18);
  }
}
