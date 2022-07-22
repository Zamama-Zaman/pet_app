// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fido_mingle/modules/home/logic.dart';
import 'package:fido_mingle/modules/home/state.dart';
import 'package:fido_mingle/modules/home/view_show_comments.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../route_generator.dart';

class ViewDetailPage extends StatefulWidget {
  final dynamic data;
  const ViewDetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewDetailPage> createState() => _ViewDetailPageState();
}

class _ViewDetailPageState extends State<ViewDetailPage> {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.data["id"] != null) {
            String postId = widget.data["id"].toString();
            Get.toNamed(
              PageRoutes.allComments,
              arguments: AllCommentsView(
                postId: postId,
              ),
            )!
                .then((value) {
              logic.getSinglePostCommentVar.clear();
            });
            print(postId);
          }
        },
        backgroundColor: customThemeColor,
        child: Icon(
          Icons.message,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight / 2.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.data["yoast_head_json"]["og_image"]?[0]["url"] ==
                              null
                          ?
                          // "https://fidomingle.com/wp-content/uploads/2018/11/20171207_114401_2.jpg"
                          "https://i.quotev.com/img/q/u/15/12/25/78a31e5f80-imag.jpg"
                          : widget.data["yoast_head_json"]["og_image"][0]
                              ["url"],
                    ),
                    // image: AssetImage("assets/splash_background.png"),
                    // fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: customThemeColor,
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text(
                      // "How to Rebrand a Company and Get It Right the First Time",
                      widget.data["yoast_head_json"]["title"],
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w500,
                        color: customThemeColor,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Written by ",
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                // text: "Kate Shokurova",
                                text: widget.data["yoast_head_json"]["schema"]
                                            ["schema"]?["@graph"][0]["name"] ==
                                        null
                                    ? "No name"
                                    : widget.data["yoast_head_json"]["schema"]
                                        ["schema"]["@graph"][0]["name"],
                                style: GoogleFonts.jost(
                                  fontWeight: FontWeight.w700,
                                  color: customThemeColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          // "Aprial 04, 20",
                          widget.data["yoast_head_json"]
                                  ["article_published_time"]
                              .toString()
                              .split("T")
                              .first,
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Divider(
                      color: customThemeColor,
                      thickness: 2,
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.data["content"]["rendered"]
                          .toString()
                          .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                      //"In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                      style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
