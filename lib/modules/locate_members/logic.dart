import 'package:fido_mingle/api_services/get_service.dart';
import 'package:get/get.dart';

import 'state.dart';

class LocateMembersLogic extends GetxController {
  final state = LocateMembersState();

  RxBool isGetAllMembers = true.obs;
  RxList<dynamic> getAllMembersVar = <dynamic>[].obs;

  @override
  void onInit() {
    getAllMembers();
    super.onInit();
  }

  Future<void> getAllMembers() async {
    try {
      isGetAllMembers.value = true;
      final response = await getMethod(
        "https://fidomingle.com/wp-json/buddypress/v1/members",
        <String, dynamic>{},
        false,
      );
      if (response.toString() == "[]") {
        isGetAllMembers.value = false;
        Get.snackbar(
          'No Members',
          'There is no members.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response != null) {
        for (var singlePost in response) {
          getAllMembersVar.add(singlePost);
        }
        isGetAllMembers.value = false;
      } else {
        isGetAllMembers.value = false;
      }
    } catch (e) {
      print("$e");
    }
  }
}
