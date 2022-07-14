import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import 'logic.dart';
import 'state.dart';

class LocateMembersPage extends StatefulWidget {
  const LocateMembersPage({Key? key}) : super(key: key);

  @override
  _LocateMembersPageState createState() => _LocateMembersPageState();
}

class _LocateMembersPageState extends State<LocateMembersPage> {
  final LocateMembersLogic logic = Get.put(LocateMembersLogic());
  final LocateMembersState state = Get.find<LocateMembersLogic>().state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocateMembersLogic>(
      builder: (_userProfileLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Locate Members',
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
                  child: Column(
                    children: [
                      ///---search
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 9,
                                    offset: Offset(0, 1))
                              ]),
                          child: TextFormField(
                            style: GoogleFonts.jost(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 20),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.search,
                                  size: 18,
                                  color: Colors.black.withOpacity(0.2)),
                              hintText: 'Enter Location',
                              hintStyle: GoogleFonts.jost(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black.withOpacity(0.2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
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
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field Required';
                              }
                            },
                          ),
                        ),
                      ),

                      ///---search-button
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
                                'Search',
                                style: state.searchButtonTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///---upper-tile
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: customPostBackgroundColor,
                                  child: Image.asset(
                                    'assets/fidoCircleImage.png',
                                    fit: BoxFit.fill,
                                    width:
                                        MediaQuery.of(context).size.width * .2,
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
                                  style: state.postTileTextStyle,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(0.5),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      ///---search-result
                      Expanded(
                        child: ListView(
                          children: List.generate(12, (index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: customGreyColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    child: ListTile(
                                      onTap: () {
                                        Get.toNamed(PageRoutes.memberDetail);
                                      },
                                      contentPadding:
                                          const EdgeInsets.fromLTRB(6, 0, 6, 0),
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 20,
                                      ),
                                      title: Text(
                                        'Ben Brainy',
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: state.titleTextStyle,
                                      ),
                                    ),
                                  )),
                            );
                          }),
                        ),
                      )
                    ],
                  )),
        ),
      ),
    );
  }
}
