import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio_instance;
import 'package:fido_mingle/api_services/header.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

Future<dynamic> getMethod(
  String apiUrl,
  dynamic queryData,
  bool addAuthHeader, // for performing functionalities
) async {
  dio_instance.Response response;
  dio_instance.Dio dio = dio_instance.Dio();

  // dio.options.connectTimeout = 10000;
  // dio.options.receiveTimeout = 6000;

  if (addAuthHeader && Get.find<ApiLogic>().storageBox.hasData('authToken')) {
    setCustomHeader(dio, 'Authorization',
        'Bearer ${Get.find<ApiLogic>().storageBox.read('authToken')}');
  } else if (addAuthHeader &&
      !Get.find<ApiLogic>().storageBox.hasData('authToken')) {}

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log('Internet Connected');
      Get.find<ApiLogic>().changeInternetCheckerState(true);
      try {
        response = await dio.get(apiUrl, queryParameters: queryData);

        if (response.statusCode == 200) {
          log('StatusCode------>> ${response.statusCode}');
          print('Response $apiUrl------>> ${response}');
        } else {
          log('StatusCode------>> ${response.statusCode}');
          log('Response $apiUrl------>> $response');
        }
        return response.data;
      } on dio_instance.DioError catch (e) {
        if (e.response != null) {
          log('Dio Error From Get $apiUrl -->> ${e.response!}');
        } else {
          log('Dio Error From Get $apiUrl -->> $e');
        }
      }
    }
  } on SocketException catch (_) {
    Get.find<ApiLogic>().changeInternetCheckerState(false);
    log('Internet Not Connected');
  }
}

Future<dynamic> postRequest(
  String apiUrl,
  dynamic queryData,
  bool addAuthHeader, // for performing functionalities
) async {
  dio_instance.Response response;
  dio_instance.Dio dio = dio_instance.Dio();

  // dio.options.connectTimeout = 10000;
  // dio.options.receiveTimeout = 6000;

  if (addAuthHeader && Get.find<ApiLogic>().storageBox.hasData('authToken')) {
    setCustomHeader(dio, 'Authorization',
        'Bearer ${Get.find<ApiLogic>().storageBox.read('authToken')}');
  } else if (addAuthHeader &&
      !Get.find<ApiLogic>().storageBox.hasData('authToken')) {}

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log('Internet Connected');
      Get.find<ApiLogic>().changeInternetCheckerState(true);
      try {
        response = await dio.post(apiUrl, data: queryData);

        if (response.statusCode == 200) {
          log('StatusCode------>> ${response.statusCode}');
          print('Response $apiUrl------>> ${response}');
        } else {
          log('StatusCode------>> ${response.statusCode}');
          log('Response $apiUrl------>> $response');
        }
        return response.data;
      } on dio_instance.DioError catch (e) {
        if (e.response != null) {
          log('Dio 1 Error From Get $apiUrl -->> ${e.response!}');
          Get.snackbar(
            'Something Went Wrong',
            '${e.response!.data["message"]}',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          log('Dio 2 Error From Get $apiUrl -->> $e');
        }
      }
    }
  } on SocketException catch (_) {
    Get.find<ApiLogic>().changeInternetCheckerState(false);
    log('Internet Not Connected');
  }
}

Future<dynamic> deleteRequest(
  String apiUrl,
  dynamic queryData,
  bool addAuthHeader, // for performing functionalities
) async {
  dio_instance.Response response;
  dio_instance.Dio dio = dio_instance.Dio();

  if (addAuthHeader && Get.find<ApiLogic>().storageBox.hasData('authToken')) {
    setCustomHeader(dio, 'Authorization',
        'Bearer ${Get.find<ApiLogic>().storageBox.read('authToken')}');
  } else if (addAuthHeader &&
      !Get.find<ApiLogic>().storageBox.hasData('authToken')) {}

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log('Internet Connected');
      Get.find<ApiLogic>().changeInternetCheckerState(true);
      try {
        response = await dio.delete(apiUrl, data: queryData);

        if (response.statusCode == 200) {
          log('StatusCode------>> ${response.statusCode}');
          print('Response $apiUrl------>> ${response}');
        } else {
          log('StatusCode------>> ${response.statusCode}');
          log('Response $apiUrl------>> $response');
        }
        return response.data;
      } on dio_instance.DioError catch (e) {
        if (e.response != null) {
          log('Dio 1 Error From Get $apiUrl -->> ${e.response!}');
          Get.snackbar(
            'Something Went Wrong',
            '${e.response!.data["message"]}',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          log('Dio 2 Error From Get $apiUrl -->> $e');
        }
      }
    }
  } on SocketException catch (_) {
    Get.find<ApiLogic>().changeInternetCheckerState(false);
    log('Internet Not Connected');
  }
}
