import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:fido_mingle/modules/activities/activities_model.dart';
import 'package:get/get.dart';

import 'state.dart';

class ActivitiesLogic extends GetxController {
  final state = ActivitiesState();

  RxList<ActivitiesComment> activitieslist = <ActivitiesComment>[].obs;

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
        activitiesURL,
        <String, dynamic>{},
        false,
      );
      if (response != null) {
        for (var singleBlog in response) {
          activitieslist.add(ActivitiesComment.fromJson(singleBlog));
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
