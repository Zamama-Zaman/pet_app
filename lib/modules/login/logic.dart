import 'dart:convert';
import 'dart:developer';
import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/logic.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:fido_mingle/modules/login/login_authorization_param_model.dart';
import 'package:get/get.dart';

import 'state.dart';

// for admin token
// {
//     "username": "fidomingle",
//     "password": "1Tysoonytoon"
// }
class LoginLogic extends GetxController {
  final state = LoginState();

  RxBool isLogin = true.obs;

  LoginAuthorizationParam loginAuthorizationParam = LoginAuthorizationParam();

  Future<bool> signInWithUsernameAndPassword(
      String username, String password) async {
    try {
      isLogin(true);
      var response = await postRequest(
        logInURL,
        <String, dynamic>{
          "username": username,
          "password": password,
        },
        false,
      );

      if (response != null) {
        loginAuthorizationParam = LoginAuthorizationParam.fromJson(response);
        Get.find<ApiLogic>()
            .storageBox
            .write("authToken", loginAuthorizationParam.token);
        isLogin(true);
        return true;
      } else {
        isLogin(false);
        return false;
      }
    } finally {
      isLogin(false);
    }
  }
}
