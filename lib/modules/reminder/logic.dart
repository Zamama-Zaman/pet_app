import 'package:fido_mingle/api_services/get_service.dart';
import 'package:get/get.dart';
import 'state.dart';

class RemindeLogic extends GetxController {
  final state = ReminderState();

  RxBool isReminderAdded = false.obs;

  Future<void> addReminder(
      String title, String email, String date, String time) async {
    try {
      isReminderAdded.value = true;
      final response = await postRequest(
        "https://fidomingle.com/wp-json/wp/v2/reminder/add",
        {"title": title, "email": email, "date": date, "time": time},
        false,
      );
      if (response != null) {
        isReminderAdded.value = false;
        Get.snackbar(
          'Successfull',
          '${response["message"]}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      isReminderAdded.value = false;
    } catch (e) {
      isReminderAdded.value = false;
      print("error: $e");
    }
  }
}
