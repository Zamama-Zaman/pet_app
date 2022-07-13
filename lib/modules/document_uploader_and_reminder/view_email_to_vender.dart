import 'package:fido_mingle/modules/document_uploader_and_reminder/logic.dart';
import 'package:fido_mingle/modules/document_uploader_and_reminder/state.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailToVenderView extends StatefulWidget {
  const EmailToVenderView({Key? key}) : super(key: key);

  @override
  _EmailToVenderViewState createState() => _EmailToVenderViewState();
}

class _EmailToVenderViewState extends State<EmailToVenderView> {
  final DocumentUploaderAndReminderLogic logic =
      Get.put(DocumentUploaderAndReminderLogic());
  final DocumentUploaderAndReminderState state =
      Get.find<DocumentUploaderAndReminderLogic>().state;

  final GlobalKey<FormState> _emailToVenderFormKey = GlobalKey();

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
            title: 'Email to Vender',
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
                      children: [
                        ///---custom-dropdown
                        InkWell(
                          onTap: () {
                            customDropDownDialog(context);
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _documentUploaderAndReminderLogic
                                                .selectedVendor !=
                                            null
                                        ? _documentUploaderAndReminderLogic
                                            .selectedVendor!
                                        : 'Select Vendor to Email',
                                    style: GoogleFonts.jost(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: _documentUploaderAndReminderLogic
                                                    .selectedVendor !=
                                                null
                                            ? Colors.black
                                            : Colors.black.withOpacity(0.2)),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                    size: 25,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///---title-field
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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

                        ///---button
                        InkWell(
                          onTap: () {
                            if (_emailToVenderFormKey.currentState!
                                .validate()) {}
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
                                style: state.buttonTextStyle,
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

  customDropDownDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: GetBuilder<DocumentUploaderAndReminderLogic>(
            builder: (_documentUploaderAndReminderLogic) => Container(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Vendor List',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    child: ListView(
                      children: List.generate(
                          _documentUploaderAndReminderLogic.vendorList.length,
                          (index) {
                        return CheckboxListTile(
                            activeColor: customThemeColor,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              '${_documentUploaderAndReminderLogic.vendorList[index].title}',
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            value: _documentUploaderAndReminderLogic
                                .vendorList[index].isSelected,
                            onChanged: (value) {
                              _documentUploaderAndReminderLogic.vendorList
                                  .forEach((element) {
                                setState(() {
                                  element.isSelected = false;
                                });
                              });
                              _documentUploaderAndReminderLogic
                                  .vendorList[index].isSelected = value;
                              setState(() {});
                              _documentUploaderAndReminderLogic
                                  .updateSelectedVendor(
                                      _documentUploaderAndReminderLogic
                                          .vendorList[index].title);
                            });
                      }),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 9,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: customThemeColor),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OK',
                              style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: customThemeColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
