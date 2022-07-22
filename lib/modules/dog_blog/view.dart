// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class DogBlogView extends StatefulWidget {
  const DogBlogView({Key? key}) : super(key: key);

  @override
  _DogBlogViewState createState() => _DogBlogViewState();
}

class _DogBlogViewState extends State<DogBlogView> {
  final DogBlogLogic logic = Get.put(DogBlogLogic());
  final DogBlogState state = Get.find<DogBlogLogic>().state;
  // final _dogBlogController = Get.find<DogBlogLogic>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DogBlogLogic>(
      builder: (_dogBlogLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Dog Blog',
            actionWidget: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          body: Obx(
            () => logic.isLoading.value
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Loading..."),
                        SizedBox(height: 20),
                        CircularProgressIndicator(
                          color: customThemeColor,
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: ListView(
                        children:
                            List.generate(logic.dogBloglist.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            child: InkWell(
                              onLongPress: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 9,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ///---user-tile
                                      ListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        leading: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.grey,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              image: DecorationImage(
                                                image: NetworkImage(logic
                                                    .dogBloglist[index]
                                                    .authorAvatarUrls["24"]!),
                                              ),
                                            ),
                                          ),
                                          // Icon(
                                          //   Icons.person,
                                          //   color: Colors.white,
                                          // ),
                                        ),
                                        title: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                // 'Ben Brainy',
                                                logic.dogBloglist[index]
                                                    .authorName,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style: state
                                                    .commentUserTitleTextStyle,
                                              ),
                                            ),
                                            SizedBox()
                                          ],
                                        ),
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // '@12benbrainy',
                                              "",
                                              overflow: TextOverflow.ellipsis,
                                              style: state
                                                  .commentUserSubTitleTextStyle,
                                            ),
                                            Expanded(
                                              child: Text(
                                                // 'Posted on: 3 Oct 2020 4:33 PM',
                                                "Posted on: ${logic.dogBloglist[index].date}",
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style: state
                                                    .commentUserSubTitleTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                      ),

                                      ///---comment
                                      Text(
                                        // 'I jus love my new brother!!! Thanks dad❤❤❤???? A beautiful Monday! #adopt #minpin #rescue #brodog',
                                        logic
                                            .dogBloglist[index].content.rendered
                                            .replaceAll(
                                                RegExp(r'<[^>]*>|&[^;]+;'),
                                                ' '),
                                        style: state.commentTextStyle,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          ///---like-section
                                          // InkWell(
                                          //   onTap: () {},
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.fromLTRB(
                                          //             0, 10, 0, 0),
                                          //     child: Row(
                                          //       children: [
                                          //         SvgPicture.asset(
                                          //           'assets/likeIcon.svg',
                                          //           width: 10,
                                          //         ),
                                          //         const SizedBox(
                                          //           width: 7,
                                          //         ),
                                          //         Text(
                                          //           'Liked (15)',
                                          //           style: state
                                          //               .postLikeBarTextStyle,
                                          //         )
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),

                                          // const SizedBox(
                                          //   width: 25,
                                          // ),

                                          ///---reply-section
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  PageRoutes.replyComment);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 10, 0, 0),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/replyIcon.svg',
                                                    width: 12,
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                    'Reply',
                                                    style: state
                                                        .postLikeBarTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
