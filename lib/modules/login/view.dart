import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logic.dart';
import 'state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  final GlobalKey<FormState> _loginFormKey = GlobalKey();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                key: _loginFormKey,
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
                              child:
                                  Text('Login', style: state.headingTextStyle),
                            ),
                          )
                        ],
                      ),
                    ),

                    ///---logo
                    Center(
                      child: SvgPicture.asset('assets/login_logo.svg',
                          width: MediaQuery.of(context).size.width * .45),
                    ),

                    ///---username-field
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
                      child: TextFormField(
                        controller: userNameController,
                        style: GoogleFonts.jost(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.person_outline,
                              color: Colors.black.withOpacity(0.2)),
                          hintText: 'Username',
                          hintStyle: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
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
                              borderSide: const BorderSide(color: Colors.red)),
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
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
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
                              vertical: 10, horizontal: 20),
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
                              fontWeight: FontWeight.normal,
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
                              borderSide: const BorderSide(color: Colors.red)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
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
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                      child: InkWell(
                        onTap: () async {
                          if (_loginFormKey.currentState!.validate()) {
                            bool check;

                            check = await Get.find<LoginLogic>()
                                .signInWithUsernameAndPassword(
                              userNameController.text.toString(),
                              passwordController.text.toString(),
                            );
                            print(check);
                            if (check) {
                              Get.toNamed(PageRoutes.home);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Wrong email or password"),
                                ),
                              );
                            }
                            // state.signInWithUsernameAndPassword(
                            //     userNameController.text.toString(),
                            //     passwordController.text.toString());
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
                              'Login',
                              style: state.loginTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                    ),

                    ///---sign-up-text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t you have account yet? ',
                          style: state.signUpNavigationTextStyle,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(PageRoutes.signUp);
                          },
                          child: Text(
                            'Create New',
                            style: state.signUpNavigationTextStyle!
                                .copyWith(color: customThemeColor),
                          ),
                        ),
                      ],
                    ),

                    ///---login-as-guest-button
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(PageRoutes.home);
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: customThemeColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Login as a Guest',
                              style: state.loginTextStyle,
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
    );
  }
}
