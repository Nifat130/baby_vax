// To parse this JSON data, do
//
//     final getUserInfoWhileLoginModel = getUserInfoWhileLoginModelFromJson(jsonString);

import 'dart:convert';

GetUserInfoWhileLoginModel getUserInfoWhileLoginModelFromJson(String str) => GetUserInfoWhileLoginModel.fromJson(json.decode(str));

String getUserInfoWhileLoginModelToJson(GetUserInfoWhileLoginModel data) => json.encode(data.toJson());

class GetUserInfoWhileLoginModel {
  bool? success;
  String? message;
  Result? result;

  GetUserInfoWhileLoginModel({
    this.success,
    this.message,
    this.result,
  });

  factory GetUserInfoWhileLoginModel.fromJson(Map<String, dynamic> json) => GetUserInfoWhileLoginModel(
    success: json["success"],
    message: json["message"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result?.toJson(),
  };
}

class Result {
  String? accessToken;
  UserInfo? userInfo;

  Result({
    this.accessToken,
    this.userInfo,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    accessToken: json["accessToken"],
    userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "userInfo": userInfo?.toJson(),
  };
}

class UserInfo {
  String? id;
  String? fullName;
  String? email;
  String? role;
  String? profileImage;
  bool? isOtpVerify;
  bool? profileDetails;
  bool? reciveNotificaiton;
  dynamic fcmToken;
  bool? isSubscription;

  UserInfo({
    this.id,
    this.fullName,
    this.email,
    this.role,
    this.profileImage,
    this.isOtpVerify,
    this.profileDetails,
    this.reciveNotificaiton,
    this.fcmToken,
    this.isSubscription,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    role: json["role"],
    profileImage: json["profileImage"],
    isOtpVerify: json["isOtpVerify"],
    profileDetails: json["profileDetails"],
    reciveNotificaiton: json["reciveNotificaiton"],
    fcmToken: json["fcmToken"],
    isSubscription: json["isSubscription"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "role": role,
    "profileImage": profileImage,
    "isOtpVerify": isOtpVerify,
    "profileDetails": profileDetails,
    "reciveNotificaiton": reciveNotificaiton,
    "fcmToken": fcmToken,
    "isSubscription": isSubscription,
  };
}
