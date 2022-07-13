import 'dart:convert';
import 'dart:developer';

import 'package:fido_mingle/api_services/get_service.dart';
import 'package:fido_mingle/api_services/logic.dart';
import 'package:fido_mingle/api_services/urls.dart';
import 'package:fido_mingle/modules/login/login_authorization_model.dart';
import 'package:get/get.dart';

import 'state.dart';

// admin token
// {
//     "username": "fidomingle",
//     "password": "1Tysoonytoon"
// }

// eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZmlkb21pbmdsZS5jb20iLCJpYXQiOjE2NTY3MDAzMjEsIm5iZiI6MTY1NjcwMDMyMSwiZXhwIjoxNjU3MzA1MTIxLCJkYXRhIjp7InVzZXIiOnsiaWQiOjEsImRldmljZSI6IiIsInBhc3MiOiIzMmE5NGRmMTc4NzU5MTczOTczZmUyZWJiNTg1NmQxNiJ9fX0.Szkwro2Ba2BJMG0197W9yECcXFak6AsMUgX-hfhZ4ZE

class LoginLogic extends GetxController {
  final state = LoginState();

  RxBool isLogin = true.obs;

  LoginAuthorization loginAuthorization = LoginAuthorization();

  Future<bool> signInWithUsernameAndPassword(
      String username, String password) async {
    try {
      log('testing');
      isLogin(true);
      var response = await postRequest(
          logInURL, {'username': username, 'password': password}, false);
      if (response != null) {
        loginAuthorization = LoginAuthorization.fromJson(response);
        Get.find<ApiLogic>()
            .storageBox
            .write("authToken", loginAuthorization.data!.token);
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
