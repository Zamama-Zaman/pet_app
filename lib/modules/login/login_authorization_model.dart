// To parse this JSON data, do
//
//     final loginAuthorization = loginAuthorizationFromJson(jsonString);

import 'dart:convert';

class LoginAuthorization {
  LoginAuthorization({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    this.data,
  });

  final bool? success;
  final int? statusCode;
  final String? code;
  final String? message;
  final Data? data;

  factory LoginAuthorization.fromRawJson(String str) =>
      LoginAuthorization.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginAuthorization.fromJson(dynamic json) {
    // dynamic json = jsonDecode(_json);
    return LoginAuthorization(
      success: json["success"],
      statusCode: json["statusCode"],
      code: json["code"],
      message: json["message"],
      data: Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "statusCode": statusCode,
      "code": code,
      "message": message,
      "data": data!.toJson(),
    };
  }
}

class Data {
  Data({
    this.token,
    this.id,
    this.email,
    this.nicename,
    this.firstName,
    this.lastName,
    this.displayName,
  });

  final String? token;
  final int? id;
  final String? email;
  final String? nicename;
  final String? firstName;
  final String? lastName;
  final String? displayName;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        id: json["id"],
        email: json["email"],
        nicename: json["nicename"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
        "email": email,
        "nicename": nicename,
        "firstName": firstName,
        "lastName": lastName,
        "displayName": displayName,
      };
}
