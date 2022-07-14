import 'dart:developer';

import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/logic.dart';
import 'package:fido_mingle/api_services/post_service.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:fido_mingle/modules/home/new_post_model.dart';
import 'package:fido_mingle/modules/home/post_model.dart';
import 'package:fido_mingle/modules/home/single_post_comment.dart';
import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final state = HomeState();
  PostModel postModel = PostModel();
  SinglePostComment singlePostComment = SinglePostComment();
  var isLoading = true.obs;
  var isSinglePostFetched = true.obs;
  bool? multiSelectorForCommentActive = false;
  int? multiSelectorCommentCount = 0;
  List<MultiSelectBox> multiSelectForDeleteCommentList = [];
  RxList<NewPostModel> getAllPostList = <NewPostModel>[].obs;

  RxList<dynamic> getAllPostResponse = <dynamic>[].obs;
  RxBool isGetSinglePostComment = true.obs;
  RxList<dynamic> getSinglePostCommentVar = <dynamic>[].obs;

  RxBool isCommentOnSinglePost = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    getAllPost();
    // getSinglePostComment();
    // getSinglePostComment2();
    super.onInit();
  }

  setMultiSelectedForDeleteCommentList() {
    // multiSelectForDeleteCommentList = [
    //   MultiSelectBox(isSelected: false),
    //   MultiSelectBox(isSelected: false),
    //   MultiSelectBox(isSelected: false),
    //   MultiSelectBox(isSelected: false),
    // ];

    // for (int i = 0; i < singlePostComment.data!.length; i++) {
    //   multiSelectForDeleteCommentList.add(MultiSelectBox(isSelected: false));
    // }
    for (int i = 0; i < getSinglePostCommentVar.length; i++) {
      multiSelectForDeleteCommentList.add(MultiSelectBox(isSelected: false));
    }
  }

  void fetchData() async {
    try {
      log('testing');
      isLoading(true);
      var response = await getMethod(baseUrl, {'query': 'posts'}, false);
      print(' check it $response');
      if (response != null) {
        postModel = PostModel.fromJson(response);
        print(' checking it ${postModel}');
      }
    } finally {
      isLoading(false);
    }
  }

  // void getSinglePostComment() async {
  //   try {
  //     log('testing');
  //     isSinglePostFetched(true);
  //     var response = await getMethod(
  //         baseUrl, {'query': 'single_post_comment', 'post_id': '20'}, false);
  //     print(' check it single post comment $response');
  //     if (response != null) {
  //       singlePostComment = SinglePostComment.fromJson(response);
  //       print(' check single post comment ${singlePostComment.data!.length}');
  //       setMultiSelectedForDeleteCommentList();
  //     }
  //   } finally {
  //     isSinglePostFetched(false);
  //   }
  // }

  Future<void> getSinglePostComment2(String postId) async {
    try {
      isGetSinglePostComment.value = true;
      final response = await getMethod(
        "https://fidomingle.com/wp-json/wp/v2/comments",
        {"post": postId},
        false,
      );
      if (response.toString() == "[]") {
        isGetSinglePostComment.value = false;
        Get.snackbar(
          'No Comment',
          'There is no comment for this post',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response != null) {
        for (var singlePost in response) {
          getSinglePostCommentVar.add(singlePost);
        }
        setMultiSelectedForDeleteCommentList();
        isGetSinglePostComment.value = false;
      } else {
        isGetSinglePostComment.value = false;
      }
    } catch (e) {
      print("$e");
    }
  }

  Future<void> getAllPost() async {
    try {
      // isLoading.value = true;
      final response = await getMethod(
        "https://fidomingle.com/wp-json/wp/v2/posts",
        <String, dynamic>{},
        false,
      );
      if (response != null) {
        for (var post in response) {
          getAllPostResponse.add(post);
        }
      }
    } catch (e) {
      print("error: $e");
    }
  }

  //Add Comment
  Future<void> addCommentToASinglePost(String postId, String comment) async {
    try {
      isCommentOnSinglePost.value = true;
      isGetSinglePostComment.value = true;
      final response = await postRequest(
        "https://fidomingle.com/wp-json/wp/v2/comments",
        {"content": comment, "post": postId},
        true,
      );
      if (response != null) {
        if (response["status"].toString() == "approved") {
          getSinglePostCommentVar.clear();
          getSinglePostComment2(postId);
          //* Successfully Posted
          Get.snackbar(
            'Succesfully',
            'Your comment was successfully submitted',
            snackPosition: SnackPosition.BOTTOM,
          );
          isCommentOnSinglePost.value = false;
        } else {
          //* Something Went Wrong
          Get.snackbar(
            'Something Went Wrong',
            'Make sure you are login',
            snackPosition: SnackPosition.BOTTOM,
          );
          isCommentOnSinglePost.value = false;
          isGetSinglePostComment.value = false;
        }
      } else {
        isCommentOnSinglePost.value = false;
        isGetSinglePostComment.value = false;
        //* Something Went Wrong
        // Get.snackbar(
        //   'Something Went Wrong',
        //   'Make sure you are login',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      }
    } catch (e) {
      isCommentOnSinglePost.value = false;
      isGetSinglePostComment.value = false;
      //* Something Went Wrong
      // Get.snackbar(
      //   'Something Went Wrong',
      //   'Make sure you are login $e',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }
  }

  Future<void> deletACommentOnAPost(String postId) async {
    try {
      isGetSinglePostComment.value = true;
      final response = await deleteRequest(
        deleteCommentURL + postId,
        <String, dynamic>{},
        true,
      );
      if (response != null) {
        for (var item in getSinglePostCommentVar) {
          if (item["id"] == response["id"]) {
            getSinglePostCommentVar.remove(item).obs;
            Get.snackbar(
              'Successfully',
              'Successfully deleted a comment',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
        isGetSinglePostComment.value = false;
      }
      isGetSinglePostComment.value = false;
    } catch (e) {
      isGetSinglePostComment.value = false;
      print("error: $e");
    }
  }

  List drawerList = [
    'Home',
    'Activities',
    'Dog Blog',
    'Cat Chat',
    'Exotic Talk',
    'Vet Clinic',
    'Messages',
    'Locate Members',
    'Document Uploader & Reminder',
    'Setting',
    'Remider',
    // 'Logout',
  ];
  drawerNavigation(
    int? index,
    BuildContext context,
  ) {
    switch (index) {
      case 0:
        {
          Navigator.pop(context);
          return Get.offAllNamed(PageRoutes.home);
        }
      case 1:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.activities);
        }
      case 2:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.dogBlog);
        }
      case 3:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.catChat);
        }
      case 4:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.exoticTalk);
        }
      case 5:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.vetClinic);
        }
      case 6:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.messages);
        }
      case 7:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.locateMembers);
        }
      case 8:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.documentUploaderAndReminder);
        }
      case 9:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.settings);
        }
      case 10:
        {
          Navigator.pop(context);
          return Get.toNamed(PageRoutes.reminder);
        }
      default:
        {
          return Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          );
        }
    }
  }
}

class MultiSelectBox {
  MultiSelectBox({this.isSelected});

  bool? isSelected;
}
