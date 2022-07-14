import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'logic.dart';
import 'state.dart';

class DocumentUploaderAndReminderPage extends StatefulWidget {
  const DocumentUploaderAndReminderPage({Key? key}) : super(key: key);

  @override
  _DocumentUploaderAndReminderPageState createState() =>
      _DocumentUploaderAndReminderPageState();
}

class _DocumentUploaderAndReminderPageState
    extends State<DocumentUploaderAndReminderPage> {
  final DocumentUploaderAndReminderLogic logic =
      Get.put(DocumentUploaderAndReminderLogic());
  final DocumentUploaderAndReminderState state =
      Get.find<DocumentUploaderAndReminderLogic>().state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentUploaderAndReminderLogic>(
      builder: (_userProfileLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Document Uploader & Reminder',
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
              : Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: List.generate(20, (index) {
                            return Padding(
                              padding: index % 2 == 0
                                  ? const EdgeInsets.fromLTRB(15, 13, 7, 13)
                                  : const EdgeInsets.fromLTRB(7, 13, 15, 13),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .435,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 9)
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ///---image
                                    SizedBox(
                                        height: 130,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(10)),
                                          child: Image.asset(
                                            'assets/splash_background.png',
                                            fit: BoxFit.cover,
                                          ),
                                        )),

                                    const SizedBox(
                                      height: 9,
                                    ),

                                    ///---name
                                    Text(
                                      'Nick Nox!',
                                      style: state.nameTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(PageRoutes.emailToVender);
                                      },
                                      child: Container(
                                        height: 24,
                                        width: 105,
                                        decoration: BoxDecoration(
                                            color: customThemeColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: Text(
                                            'Email to Vender',
                                            style: state.smallButtonTextStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      )),
                ),
          // bottomNavigationBar: InkWell(
          //   onTap: () {
          //     Get.toNamed(PageRoutes.addNewDocument);
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          //     child: Container(
          //       height: 50,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(
          //           color: customThemeColor,
          //           borderRadius: BorderRadius.circular(8)),
          //       child: Center(
          //         child: Text(
          //           'Add New Document',
          //           style: state.buttonTextStyle,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
