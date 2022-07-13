import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:get/get.dart';

import 'state.dart';

class SignUpLogic extends GetxController {
  final state = SignUpState();

  RxBool isRegister = true.obs;

  String? selectedGender;
  List<String> genderDropDownList = ['Male', 'Female', 'Other'];

  Future<bool> signUpWithUsernameEmailAndPassword(
      String username, String email, String password) async {
    try {
      var response = await postRequest(registerURL,
          {'username': username, 'email': email, 'password': password}, false);
      if (response != null) {
        if (response["code"] == 200) {
          isRegister(true);
          return true;
        } else {
          isRegister(false);
          return false;
        }
      } else {
        isRegister(false);
        return false;
      }
    } finally {
      isRegister(false);
    }
  }

  // Future<bool> signInWithUsernameAndPassword(
  //     String username, String password) async {
  //   try {
  //     log('testing');
  //     isLogin(true);
  //     var response = await postRequest(
  //         logInURL, {'username': username, 'password': password}, false);
  //     if (response != null) {
  //       loginAuthorization = LoginAuthorization.fromJson(response);
  //       isLogin(true);
  //       return true;
  //     } else {
  //       isLogin(false);
  //       return false;
  //     }
  //   } finally {
  //     isLogin(false);
  //   }
  // }
}
