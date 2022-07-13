import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginState {
  TextStyle? headingTextStyle;
  TextStyle? loginTextStyle;
  TextStyle? signUpNavigationTextStyle;
  LoginState() {
    ///Initialize variables
    headingTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 32);
    loginTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18);
    signUpNavigationTextStyle = GoogleFonts.jost(
        fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14);
  }
}
