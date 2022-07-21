// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fido_mingle/modules/reminder/logic.dart';
import 'package:fido_mingle/modules/reminder/state.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final RemindeLogic logic = Get.put(RemindeLogic());
  final ReminderState state = Get.find<RemindeLogic>().state;
  final GlobalKey<FormState> _emailToVenderFormKey = GlobalKey();

  final TextEditingController reminderCtr = TextEditingController();
  final TextEditingController emailAddressCtr = TextEditingController();
  final TextEditingController dateOfReminderCtr = TextEditingController();
  final TextEditingController timeOfReminderCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RemindeLogic>(
      builder: (_reminderLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Reminder',
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
              child: Form(
                key: _emailToVenderFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enter your reminder:',
                        style: GoogleFonts.jost(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: reminderCtr,
                          style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Take Fido For a Walk',
                            hintStyle: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5),
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: customThemeColor,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
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

                      /// Enter Email Address to send reminder to
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Enter address to send reminder to:',
                        style: GoogleFonts.jost(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: emailAddressCtr,
                          style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'youremailaddress@email.com',
                            hintStyle: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.5),
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: customThemeColor,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
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

                      /// When to send reminder
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'When to send reminder:',
                        style: GoogleFonts.jost(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: TextFormField(
                                controller: dateOfReminderCtr,
                                style: GoogleFonts.jost(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '2022-06-26',
                                  hintStyle: GoogleFonts.jost(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.5),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: customThemeColor,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
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
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: TextFormField(
                                controller: timeOfReminderCtr,
                                style: GoogleFonts.jost(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: '02:00 pm',
                                  hintStyle: GoogleFonts.jost(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.5),
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: customThemeColor,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                  ),
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
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      ///---button
                      InkWell(
                        onTap: () {
                          if (_emailToVenderFormKey.currentState!.validate()) {
                            logic.addReminder(
                              reminderCtr.text.toString(),
                              emailAddressCtr.text.toString(),
                              dateOfReminderCtr.text.toString(),
                              timeOfReminderCtr.text.toString(),
                            );
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
                              'Add Reminder',
                              style: state.buttonTextStyle,
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
