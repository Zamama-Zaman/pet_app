import 'dart:convert';
import 'dart:developer';

import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:fido_mingle/modules/dog_blog/dog_blog_model.dart';
import 'package:get/get.dart';

import 'state.dart';

class DogBlogLogic extends GetxController {
  final state = DogBlogState();

  RxList<DogBlogComment> dogBloglist = <DogBlogComment>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getAllDogBlogComment();
    super.onInit();
  }

  Future<void> getAllDogBlogComment() async {
    try {
      isLoading.value = true;
      final response = await getMethod(
        dogBlogURL,
        <String, dynamic>{},
        false,
      );
      if (response != null) {
        for (var singleBlog in response) {
          dogBloglist.add(DogBlogComment.fromJson(singleBlog));
        }
        isLoading.value = false;
      } else {
        isLoading.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> replayToAPost(String postId, String content) async {
    try {
      isLoading.value = true;
      final response = await getMethod(
        "$blogURL?post=$postId&content=$content",
        <String, dynamic>{},
        false,
      );
      if (response != null) {
        for (var singleBlog in response) {
          dogBloglist.add(DogBlogComment.fromJson(singleBlog));
        }
        isLoading.value = false;
      } else {
        isLoading.value = true;
      }
    } catch (e) {
      print(e);
    }
  }
}
