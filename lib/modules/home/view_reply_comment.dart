import 'package:fido_mingle/modules/home/logic.dart';
import 'package:fido_mingle/modules/home/state.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReplyToCommentView extends StatefulWidget {
  const ReplyToCommentView({Key? key}) : super(key: key);

  @override
  _ReplyToCommentViewState createState() => _ReplyToCommentViewState();
}

class _ReplyToCommentViewState extends State<ReplyToCommentView> {
  final HomeState state = Get.find<HomeLogic>().state;

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
        appBar: const MyCustomAppBar(
          title: 'Reply to Post',
        ),
        body: true
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    children: [
                      ///---header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: customPostBackgroundColor,
                              child: Image.asset(
                                'assets/fidoCircleImage.png',
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * .2,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Fido New Articles, and More...',
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: state.postTileTextStyle!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: customDividerColor,
                      ),

                      ///---text-area
                      Expanded(
                        child: TextField(
                          style: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              hintText: 'Type here your text message...',
                              hintStyle: state.hintTextStyle,
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none),
                        ),
                      ),

                      ///---add-photo-button
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      //   child: InkWell(
                      //     onTap: () {
                      //       photoSelectDialog(context);
                      //     },
                      //     child: Container(
                      //       height: 50,
                      //       width: MediaQuery.of(context).size.width,
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           border: Border.all(color: customThemeColor),
                      //           borderRadius: BorderRadius.circular(8)),
                      //       child: Center(
                      //         child: Text(
                      //           'Add a Photo',
                      //           style: state.buttonTextStyle!.copyWith(
                      //               color: customThemeColor,
                      //               fontWeight: FontWeight.w400),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      ///---post-button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 10),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: customThemeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Post',
                                style: state.buttonTextStyle,
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
