import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logic.dart';
import 'state.dart';

class VetClinicView extends StatefulWidget {
  const VetClinicView({Key? key}) : super(key: key);

  @override
  _VetClinicViewState createState() => _VetClinicViewState();
}

class _VetClinicViewState extends State<VetClinicView> {
  final VetClinicLogic logic = Get.put(VetClinicLogic());
  final VetClinicState state = Get.find<VetClinicLogic>().state;

  final GlobalKey<FormState> _vetClinicFormKey = GlobalKey();

  final TextEditingController vetClinicAddressController =
      TextEditingController();
  final TextEditingController vetClinicZipCodeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VetClinicLogic>(
      builder: (_vetClinicLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Vet Clinic',
          ),
          body: true
              ? forThisFunctionUseWebside()
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                    child: Form(
                      key: _vetClinicFormKey,
                      child: Column(
                        children: [
                          ///---address-field
                          TextFormField(
                            controller: vetClinicAddressController,
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
                              hintText: 'Address',
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

                          ///---zip-code-field
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: TextFormField(
                              controller: vetClinicZipCodeController,
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
                                hintText: 'Zip Code',
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _vetClinicLogic.selectedMile != null
                                          ? _vetClinicLogic.selectedMile!
                                          : 'Select Miles',
                                      style: GoogleFonts.jost(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: _vetClinicLogic.selectedMile !=
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
                          )
                        ],
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
            child: GetBuilder<VetClinicLogic>(
              builder: (_vetClinicLogic) => Container(
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
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
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
                              'Select Miles',
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
                            _vetClinicLogic.milesList.length, (index) {
                          return CheckboxListTile(
                              activeColor: customThemeColor,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                '${_vetClinicLogic.milesList[index].title}',
                                style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black),
                              ),
                              value:
                                  _vetClinicLogic.milesList[index].isSelected,
                              onChanged: (value) {
                                _vetClinicLogic.milesList.forEach((element) {
                                  setState(() {
                                    element.isSelected = false;
                                  });
                                });
                                _vetClinicLogic.milesList[index].isSelected =
                                    value;
                                setState(() {});
                                _vetClinicLogic.updateSelectedMile(
                                    _vetClinicLogic.milesList[index].title);
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
        });
  }
}

Widget forThisFunctionUseWebside() {
  return const Center(
    child: Text(
      "For this function use website",
      style: TextStyle(
        fontSize: 16,
      ),
    ),
  );
}
