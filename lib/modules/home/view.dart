// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:fido_mingle/api_services/logic.dart';
import 'package:fido_mingle/modules/home/detail_view.dart';
import 'package:fido_mingle/modules/home/view_add_comment.dart';
import 'package:fido_mingle/modules/home/view_show_comments.dart';
import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:skeletons/skeletons.dart';

import 'logic.dart';
import 'state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeLogic>(
      init: HomeLogic(),
      builder: (homeLogic) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: customThemeColor,
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: SvgPicture.asset('assets/drawerIcon.svg'),
            ),
          ),
          title: Text(
            'HOME',
            style: GoogleFonts.jost(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () async {
                  // print(Get.find<ApiLogic>().storageBox.read("authToken"));

                  String decodeUserData(String code) {
                    String normalizedSource =
                        base64Url.normalize(code.split(".")[1]);
                    return utf8.decode(base64Url.decode(normalizedSource));
                  }

                  print(
                    decodeUserData(
                        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZmlkb21pbmdsZS5jb20iLCJpYXQiOjE2NTg3NDcwNDUsIm5iZiI6MTY1ODc0NzA0NSwiZXhwIjoxNjU5MzUxODQ1LCJkYXRhIjp7InVzZXIiOnsiaWQiOiIyNzE4In19fQ.KtapCvRSvmd-ztjELCegmgGc77NhV9qCPB3nlSl03Lo"),
                  );
                },
                icon: const Icon(Icons.ac_unit)),
          ],
        ),
        drawer: const MyCustomDrawer(),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ///---search-header
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: customThemeColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 10,
                          blurRadius: 9,
                        )
                      ],
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.black.withOpacity(0.2),
                              size: 20,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Enter min 3 words to search',
                              style: state.searchBarTextStyle,
                            )
                            // const Expanded(
                            //   child: TextField(
                            //     decoration: InputDecoration(
                            //       hintText: 'Enter min 3 words to search',
                            //       hintStyle: state.searchBarTextStyle,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )),

              ///---posts
              Expanded(
                child: logic.isLoading.value == true
                    ? ListView(
                        children: List.generate(3, (index) {
                          return SkeletonItem(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 30, 15, 30),
                              child: Column(
                                children: [
                                  ///---upper-tile
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: customPostBackgroundColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              blurRadius: 9,
                                              spreadRadius: 1,
                                              offset: const Offset(7, 8))
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 7, 12, 7),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                customPostBackgroundColor,
                                            child: Image.asset(
                                              'assets/fidoCircleImage.png',
                                              fit: BoxFit.fill,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
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
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: customPostBackgroundColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              blurRadius: 9,
                                              spreadRadius: 1,
                                              offset: const Offset(7, 8))
                                        ]),
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            7, 7, 7, 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/splash_background.png',
                                              height: 270,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              fit: BoxFit.cover,
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Row(
                                              children: [
                                                ///---like-section
                                                // InkWell(
                                                //   onTap: () {},
                                                //   child: Padding(
                                                //     padding: const EdgeInsets
                                                //         .fromLTRB(0, 10, 0, 0),
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

                                                const SizedBox(
                                                  width: 25,
                                                ),

                                                ///---comment-section
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                      PageRoutes.addComment,
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/commentIcon.svg',
                                                          width: 10,
                                                        ),
                                                        const SizedBox(
                                                          width: 7,
                                                        ),
                                                        Text(
                                                          'Comment',
                                                          style: state
                                                              .postLikeBarTextStyle,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                      PageRoutes.allComments,
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 0, 0),
                                                    child: Text(
                                                      'Show Comments (15)',
                                                      style: state
                                                          .postLikeBarTextStyle,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),

                                            ///---view-more-section
                                            Text(
                                              'View more...',
                                              style: state.postLikeBarTextStyle,
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      )
                    : ListView(
                        //  logic.postModel.value.data!.data!
                        children: logic.getAllPostResponse
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  15,
                                  30,
                                  15,
                                  30,
                                ),
                                child: Column(
                                  children: [
                                    ///---upper-tile
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: customPostBackgroundColor,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                blurRadius: 9,
                                                spreadRadius: 1,
                                                offset: const Offset(7, 8))
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          12,
                                          7,
                                          12,
                                          7,
                                        ),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  customPostBackgroundColor,
                                              child: Image.asset(
                                                'assets/fidoCircleImage.png',
                                                fit: BoxFit.fill,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: Text(
                                                // 'Fido New Articles, and More...',
                                                'Fido ${e["title"]["rendered"]}',
                                                softWrap: true,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: state.postTileTextStyle,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: customPostBackgroundColor,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.4),
                                                blurRadius: 9,
                                                spreadRadius: 1,
                                                offset: const Offset(7, 8))
                                          ]),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              7, 7, 7, 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                // 'assets/splash_background.png',
                                                e["yoast_head_json"]["og_image"]
                                                            ?[0]["url"] ==
                                                        null
                                                    ?
                                                    // "https://fidomingle.com/wp-content/uploads/2018/11/20171207_114401_2.jpg"
                                                    "https://i.quotev.com/img/q/u/15/12/25/78a31e5f80-imag.jpg"
                                                    : e["yoast_head_json"]
                                                        ["og_image"][0]["url"],
                                                height: 270,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.cover,
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  ///---like-section
                                                  // InkWell(
                                                  //   onTap: () {},
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets
                                                  //             .fromLTRB(
                                                  //         0, 10, 0, 0),
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

                                                  ///---comment-section
                                                  InkWell(
                                                    onTap: () {
                                                      // Get.toNamed(PageRoutes
                                                      //     .addComment);
                                                      if (e["id"] != null) {
                                                        String postId =
                                                            e["id"].toString();
                                                        Get.toNamed(
                                                          PageRoutes.addComment,
                                                          arguments:
                                                              AddCommentView(
                                                                  postId:
                                                                      postId),
                                                        );
                                                        print(postId);
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 10, 0, 0),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/commentIcon.svg',
                                                            width: 10,
                                                          ),
                                                          const SizedBox(
                                                            width: 7,
                                                          ),
                                                          Text(
                                                            'Comment',
                                                            style: state
                                                                .postLikeBarTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  const SizedBox(
                                                    width: 25,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (e["id"] != null) {
                                                        String postId =
                                                            e["id"].toString();
                                                        Get.toNamed(
                                                          PageRoutes
                                                              .allComments,
                                                          arguments:
                                                              AllCommentsView(
                                                            postId: postId,
                                                          ),
                                                        )!
                                                            .then((value) {
                                                          logic
                                                              .getSinglePostCommentVar
                                                              .clear();
                                                        });
                                                        print(postId);
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                        0,
                                                        10,
                                                        0,
                                                        0,
                                                      ),
                                                      child: Text(
                                                        'Show Comments',
                                                        style: state
                                                            .postLikeBarTextStyle,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),

                                              ///---view-more-section
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewDetailPage(
                                                        data: e,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  'View more...',
                                                  style: state
                                                      .postLikeBarTextStyle,
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
