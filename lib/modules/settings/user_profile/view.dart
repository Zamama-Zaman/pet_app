import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';
import 'logic.dart';
import 'state.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final UserProfileLogic logic = Get.put(UserProfileLogic());
  final UserProfileState state = Get.find<UserProfileLogic>().state;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileLogic>(
      builder: (_userProfileLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Profile',
          ),
          body: Constant.isUseWebside
              ? const Center(
                  child: Text(
                    "For this function use website",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ///---profile-pic
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 9),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 40,
                                child: Image.asset(
                                  'assets/fidoCircleImage.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                photoSelectDialog(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                child: Text(
                                  'Change Profile Image',
                                  style: state.changePicTextStyle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      ///--name-field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                            child: Text(
                              'Name:',
                              style: state.labelTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
                            child: TextFormField(
                              controller: userNameController,
                              style: GoogleFonts.jost(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              keyboardType: TextInputType.name,
                              cursorColor: customThemeColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.5))),
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
                                        color: Colors.black.withOpacity(0.5))),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field Required';
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                      ///--email-field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                            child: Text(
                              'Email:',
                              style: state.labelTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
                            child: TextFormField(
                              controller: emailController,
                              style: GoogleFonts.jost(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              keyboardType: TextInputType.name,
                              cursorColor: customThemeColor,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.5))),
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
                                        color: Colors.black.withOpacity(0.5))),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field Required';
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                      ///---save-button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: customThemeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Save',
                                style: state.buttonTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
        ),
      ),
    );
  }

  photoSelectDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 9,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Row(
                        children: [
                          Text(
                            'Select Image',
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Use Camera',
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Select From Library',
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'Cancel',
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
