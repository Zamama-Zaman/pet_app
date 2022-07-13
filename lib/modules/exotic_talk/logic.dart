import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:fido_mingle/modules/exotic_talk/exotic_talk_model.dart';
import 'package:get/get.dart';

import 'state.dart';

class ExoticTalkLogic extends GetxController {
  final state = ExoticTalkState();

  RxList<ExoticTalkComment> exoticTalklist = <ExoticTalkComment>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getAllExoticTalkComment();
    super.onInit();
  }

  Future<void> getAllExoticTalkComment() async {
    try {
      isLoading.value = true;
      final response = await getMethod(
        exoticTalkURL,
        <String, dynamic>{},
        false,
      );
      if (response != null) {
        for (var singleBlog in response) {
          exoticTalklist.add(ExoticTalkComment.fromJson(singleBlog));
        }
        isLoading.value = false;
      } else {
        isLoading.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<void> replayToAPost(String postId, String content) async {
  //   try {
  //     isLoading.value = true;
  //     final response = await getMethod(
  //       "$blogURL?post=$postId&content=$content",
  //       <String, dynamic>{},
  //       false,
  //     );
  //     if (response != null) {
  //       for (var singleBlog in response) {
  //         dogBloglist.add(DogBlogComment.fromJson(singleBlog));
  //       }
  //       isLoading.value = false;
  //     } else {
  //       isLoading.value = true;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
