import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:fido_mingle/modules/cat_chat/cat_blog_model.dart';
import 'package:get/get.dart';

import 'state.dart';

class CatChatLogic extends GetxController {
  final state = CatChatState();

  RxList<CatBlogComment> catBloglist = <CatBlogComment>[].obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getAllCatBlogComment();
    super.onInit();
  }

  Future<void> getAllCatBlogComment() async {
    try {
      isLoading.value = true;
      final response = await getMethod(
        catBlogURL,
        <String, dynamic>{},
        false,
      );
      if (response != null) {
        for (var singleBlog in response) {
          catBloglist.add(CatBlogComment.fromJson(singleBlog));
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
