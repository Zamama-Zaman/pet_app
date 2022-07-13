import 'dart:developer';

import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logic.dart';
import 'state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpLogic logic = Get.put(SignUpLogic());
  final SignUpState state = Get.find<SignUpLogic>().state;
  final GlobalKey<FormState> _signUpFormKey = GlobalKey();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpLogic>(
      builder: (_signUpLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///---header
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .3,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/login_header_1.png',
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Image.asset(
                              'assets/login_header_2.png',
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Text('Sign Up',
                                    style: state.headingTextStyle),
                              ),
                            )
                          ],
                        ),
                      ),

                      ///---first-last-name
                      Row(
                        children: [
                          ///---first-name-field
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 40, 7, 0),
                              child: TextFormField(
                                controller: firstNameController,
                                style: GoogleFonts.jost(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.person_outline,
                                      color: Colors.black.withOpacity(0.2)),
                                  hintText: 'First Name',
                                  hintStyle: GoogleFonts.jost(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: customThemeColor)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field Required';
                                  }
                                },
                              ),
                            ),
                          ),

                          ///---last-name-field
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(7, 40, 15, 0),
                              child: TextFormField(
                                controller: lastNameController,
                                style: GoogleFonts.jost(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.person_outline,
                                      color: Colors.black.withOpacity(0.2)),
                                  hintText: 'Last Name',
                                  hintStyle: GoogleFonts.jost(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: customThemeColor)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field Required';
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///---phone-gender
                      Row(
                        children: [
                          ///---phone-field
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 20, 7, 0),
                              child: TextFormField(
                                controller: phoneController,
                                style: GoogleFonts.jost(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.phone,
                                      color: Colors.black.withOpacity(0.2)),
                                  hintText: 'Phone Number',
                                  hintStyle: GoogleFonts.jost(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: customThemeColor)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field Required';
                                  }
                                },
                              ),
                            ),
                          ),

                          ///---gender
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(7, 20, 15, 0),
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    onTap: () {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);
                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 0.0),
                                      fillColor: Colors.white,
                                      filled: true,
                                      prefixIcon: Icon(Icons.person_outline,
                                          color: Colors.black.withOpacity(0.2)),
                                      hintText: 'Gender',
                                      hintStyle: GoogleFonts.jost(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: customThemeColor)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.red)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.5))),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.5))),
                                    ),
                                    focusColor: Colors.white,
                                    style: GoogleFonts.jost(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: Colors.black),
                                    iconEnabledColor: customThemeColor,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    value: _signUpLogic.selectedGender,
                                    items: _signUpLogic.genderDropDownList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      log(value.toString());
                                      setState(() {
                                        _signUpLogic.selectedGender = value;
                                      });
                                    },
                                    validator: (String? value) {
                                      if (value == null) {
                                        return 'Field is Required';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///---email-field
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: TextFormField(
                          controller: emailController,
                          style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.email_outlined,
                                color: Colors.black.withOpacity(0.2)),
                            hintText: 'Email',
                            hintStyle: GoogleFonts.jost(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.5))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: customThemeColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.5))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Required';
                            } else if (!GetUtils.isEmail(
                                emailController.text)) {
                              return 'Enter Valid Email';
                            }
                          },
                        ),
                      ),

                      ///---username-field
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: TextFormField(
                          controller: userNameController,
                          style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.person_outline,
                                color: Colors.black.withOpacity(0.2)),
                            hintText: 'Username',
                            hintStyle: GoogleFonts.jost(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.5))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: customThemeColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.5))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Required';
                            }
                          },
                        ),
                      ),

                      ///---password-field
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: obscureText,
                          style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.lock_outline,
                                color: Colors.black.withOpacity(0.2)),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              child: Icon(
                                !obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.jost(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.5))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: customThemeColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.5))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Required';
                            }
                          },
                        ),
                      ),

                      ///---login-button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                        child: InkWell(
                          onTap: () async {
                            if (_signUpFormKey.currentState!.validate()) {
                              bool check;

                              userNameController.text.toString();

                              check = await Get.find<SignUpLogic>()
                                  .signUpWithUsernameEmailAndPassword(
                                userNameController.text.toString(),
                                emailController.text.toString(),
                                passwordController.text.toString(),
                              );
                              print(check);
                              if (check) {
                                print("Succefully Rigestered");
                                // Get.toNamed(PageRoutes.home);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Wrong email or password"),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: customThemeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: state.signUpTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
