import 'dart:developer';

import 'package:fido_mingle/modules/locate_members/logic.dart';
import 'package:fido_mingle/modules/locate_members/state.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberDetailView extends StatefulWidget {
  const MemberDetailView({Key? key}) : super(key: key);

  @override
  _MemberDetailViewState createState() => _MemberDetailViewState();
}

class _MemberDetailViewState extends State<MemberDetailView> {
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
          appBar: MyCustomAppBar(
            title: 'Member Name',
            actionWidget: InkWell(
              onTap: () {
                log('Press---->>');
                dotsMenuDialog(context);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ///---upper-tile
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
                    child: ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                      trailing: Container(
                        height: 36,
                        width: 110,
                        decoration: BoxDecoration(
                            color: customThemeColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Send Message',
                            style: state.smallButtonTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///---previous-post
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Container(
                      height: 36,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: customDrawerYellowColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
                        child: Row(
                          children: [
                            Text(
                              'Previous Post:',
                              style: state.smallButtonTextStyle!
                                  .copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      'No Post Found',
                      style: GoogleFonts.jost(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ))
                ],
              )),
        ),
      ),
    );
  }

  dotsMenuDialog(BuildContext context) {
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
                              'Report User',
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
                              'Block content from this user',
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
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
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
