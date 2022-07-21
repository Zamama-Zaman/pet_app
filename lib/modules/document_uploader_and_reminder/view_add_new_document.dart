import 'package:fido_mingle/modules/document_uploader_and_reminder/logic.dart';
import 'package:fido_mingle/modules/document_uploader_and_reminder/state.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewDocumentView extends StatefulWidget {
  const AddNewDocumentView({Key? key}) : super(key: key);

  @override
  _AddNewDocumentViewState createState() => _AddNewDocumentViewState();
}

class _AddNewDocumentViewState extends State<AddNewDocumentView> {
  final DocumentUploaderAndReminderLogic logic =
      Get.put(DocumentUploaderAndReminderLogic());
  final DocumentUploaderAndReminderState state =
      Get.find<DocumentUploaderAndReminderLogic>().state;

  final GlobalKey<FormState> _addNewDocumentFormKey = GlobalKey();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentUploaderAndReminderLogic>(
      builder: (_documentUploaderAndReminderLogic) => GestureDetector(
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
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                child: Form(
                  key: _addNewDocumentFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///---image-button
                        InkWell(
                          onTap: () {
                            photoSelectDialog(context);
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: customThemeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/cameraPickerImage.svg'),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Select Image',
                                  style: state.buttonTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 23,
                        ),
                        Text(
                          'Additional Information:',
                          style: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),

                        ///---title-field
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: TextFormField(
                            controller: titleController,
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
                              hintText: 'Title...',
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

                        ///---note-field
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                          child: TextFormField(
                            controller: noteController,
                            style: GoogleFonts.jost(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            keyboardType: TextInputType.name,
                            maxLines: 6,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Write Note...',
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

                        ///---upload-button
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: customThemeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                'Upload Document',
                                style: state.buttonTextStyle,
                              ),
                            ),
                          ),
                        ),

                        ///---set-notification-buttom
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: customThemeColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  'Set A Notification',
                                  style: state.buttonTextStyle!.copyWith(
                                      color: customThemeColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
        },);
  }
}
