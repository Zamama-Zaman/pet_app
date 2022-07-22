// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class CatChatView extends StatefulWidget {
  const CatChatView({Key? key}) : super(key: key);

  @override
  _CatChatViewState createState() => _CatChatViewState();
}

class _CatChatViewState extends State<CatChatView> {
  final CatChatLogic logic = Get.put(CatChatLogic());
  final CatChatState state = Get.find<CatChatLogic>().state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatChatLogic>(
      builder: (_catChatLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Cat Chat',
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
                            List.generate(logic.catBloglist.length, (index) {
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
                                                    .catBloglist[index]
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
                                                logic.catBloglist[index]
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
                                                "Posted on: ${logic.catBloglist[index].date}",
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
                                            .catBloglist[index].content.rendered
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
          // SizedBox(
          //     height: MediaQuery.of(context).size.height,
          //     width: MediaQuery.of(context).size.width,
          //     child: ListView(
          //       children: List.generate(3, (index) {
          //         return Padding(
          //           padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
          //           child: Column(
          //             children: [
          //               ///---upper-tile
          //               Container(
          //                 width: MediaQuery.of(context).size.width,
          //                 decoration: BoxDecoration(
          //                     color: customPostBackgroundColor,
          //                     boxShadow: [
          //                       BoxShadow(
          //                           color: Colors.grey.withOpacity(0.4),
          //                           blurRadius: 9,
          //                           spreadRadius: 1,
          //                           offset: const Offset(7, 8))
          //                     ]),
          //                 child: Padding(
          //                   padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
          //                   child: Row(
          //                     children: [
          //                       CircleAvatar(
          //                         radius: 20,
          //                         backgroundColor: customPostBackgroundColor,
          //                         child: Image.asset(
          //                           'assets/fidoCircleImage.png',
          //                           fit: BoxFit.fill,
          //                           width:
          //                               MediaQuery.of(context).size.width * .2,
          //                         ),
          //                       ),
          //                       const SizedBox(
          //                         width: 8,
          //                       ),
          //                       Text(
          //                         'Fido New Articles, and More...',
          //                         softWrap: true,
          //                         maxLines: 1,
          //                         overflow: TextOverflow.ellipsis,
          //                         style: state.postTileTextStyle,
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 8,
          //               ),
          //               Container(
          //                 width: MediaQuery.of(context).size.width,
          //                 decoration: BoxDecoration(
          //                     color: customPostBackgroundColor,
          //                     boxShadow: [
          //                       BoxShadow(
          //                           color: Colors.grey.withOpacity(0.4),
          //                           blurRadius: 9,
          //                           spreadRadius: 1,
          //                           offset: const Offset(7, 8))
          //                     ]),
          //                 child: Padding(
          //                     padding: const EdgeInsets.fromLTRB(7, 7, 7, 10),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         Image.asset(
          //                           'assets/splash_background.png',
          //                           height: 270,
          //                           width: MediaQuery.of(context).size.width,
          //                           fit: BoxFit.cover,
          //                         ),
          //                         const SizedBox(
          //                           height: 3,
          //                         ),
          //                         Row(
          //                           children: [
          //                             ///---like-section
          //                             InkWell(
          //                               onTap: () {},
          //                               child: Padding(
          //                                 padding: const EdgeInsets.fromLTRB(
          //                                     0, 10, 0, 0),
          //                                 child: Row(
          //                                   children: [
          //                                     SvgPicture.asset(
          //                                       'assets/likeIcon.svg',
          //                                       width: 10,
          //                                     ),
          //                                     const SizedBox(
          //                                       width: 7,
          //                                     ),
          //                                     Text(
          //                                       'Liked (15)',
          //                                       style:
          //                                           state.postLikeBarTextStyle,
          //                                     )
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),

          //                             const SizedBox(
          //                               width: 25,
          //                             ),

          //                             ///---reply-section
          //                             InkWell(
          //                               onTap: () {
          //                                 Get.toNamed(PageRoutes.addComment);
          //                               },
          //                               child: Padding(
          //                                 padding: const EdgeInsets.fromLTRB(
          //                                     0, 10, 0, 0),
          //                                 child: Row(
          //                                   children: [
          //                                     SvgPicture.asset(
          //                                       'assets/replyIcon.svg',
          //                                       width: 10,
          //                                     ),
          //                                     const SizedBox(
          //                                       width: 7,
          //                                     ),
          //                                     Text(
          //                                       'Reply',
          //                                       style:
          //                                           state.postLikeBarTextStyle,
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         const SizedBox(
          //                           height: 20,
          //                         ),

          //                         ///---view-more-section
          //                         Text(
          //                           'View more...',
          //                           style: state.postLikeBarTextStyle,
          //                         )
          //                       ],
          //                     )),
          //               ),
          //             ],
          //           ),
          //         );
          //       }),
          //     )),
        ),
      ),
    );
  }
}
