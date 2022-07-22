import 'dart:convert';

class LoginAuthorizationParam {
  LoginAuthorizationParam({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  final String? token;
  final String? userEmail;
  final String? userNicename;
  final String? userDisplayName;

  factory LoginAuthorizationParam.fromRawJson(String str) =>
      LoginAuthorizationParam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginAuthorizationParam.fromJson(Map<String, dynamic> json) =>
      LoginAuthorizationParam(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
