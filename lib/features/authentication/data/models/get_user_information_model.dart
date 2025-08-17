// To parse this JSON data, do
//
//     final getUserInformation = getUserInformationFromJson(jsonString);

import 'dart:convert';

GetUserInformation getUserInformationFromJson(String str) => GetUserInformation.fromJson(json.decode(str));

String getUserInformationToJson(GetUserInformation data) => json.encode(data.toJson());

class GetUserInformation {
  bool? success;
  String? message;
  Result? result;

  GetUserInformation({
    this.success,
    this.message,
    this.result,
  });

  factory GetUserInformation.fromJson(Map<String, dynamic> json) => GetUserInformation(
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
  String? id;
  String? fullName;
  String? email;
  String? role;
  String? password;
  String? profileImage;
  bool? isOtpVerify;
  bool? profileDetails;
  bool? reciveNotificaiton;
  dynamic fcmToken;
  bool? isSubscription;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic providerProfile;
  FacilityProfile? facilityProfile;

  Result({
    this.id,
    this.fullName,
    this.email,
    this.role,
    this.password,
    this.profileImage,
    this.isOtpVerify,
    this.profileDetails,
    this.reciveNotificaiton,
    this.fcmToken,
    this.isSubscription,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.providerProfile,
    this.facilityProfile,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    role: json["role"],
    password: json["password"],
    profileImage: json["profileImage"],
    isOtpVerify: json["isOtpVerify"],
    profileDetails: json["profileDetails"],
    reciveNotificaiton: json["reciveNotificaiton"],
    fcmToken: json["fcmToken"],
    isSubscription: json["isSubscription"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    providerProfile: json["providerProfile"],
    facilityProfile: json["facilityProfile"] == null ? null : FacilityProfile.fromJson(json["facilityProfile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "role": role,
    "password": password,
    "profileImage": profileImage,
    "isOtpVerify": isOtpVerify,
    "profileDetails": profileDetails,
    "reciveNotificaiton": reciveNotificaiton,
    "fcmToken": fcmToken,
    "isSubscription": isSubscription,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "providerProfile": providerProfile,
    "facilityProfile": facilityProfile?.toJson(),
  };
}

class FacilityProfile {
  String? id;
  String? facilityName;
  String? address;
  String? facilityType;
  String? ehrSystem;
  String? caseType;
  String? orLoad;
  String? credentialDetails;
  String? mdDo;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  FacilityProfile({
    this.id,
    this.facilityName,
    this.address,
    this.facilityType,
    this.ehrSystem,
    this.caseType,
    this.orLoad,
    this.credentialDetails,
    this.mdDo,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory FacilityProfile.fromJson(Map<String, dynamic> json) => FacilityProfile(
    id: json["id"],
    facilityName: json["facilityName"],
    address: json["address"],
    facilityType: json["facilityType"],
    ehrSystem: json["ehrSystem"],
    caseType: json["caseType"],
    orLoad: json["orLoad"],
    credentialDetails: json["credentialDetails"],
    mdDo: json["md_do"],
    userId: json["userId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "facilityName": facilityName,
    "address": address,
    "facilityType": facilityType,
    "ehrSystem": ehrSystem,
    "caseType": caseType,
    "orLoad": orLoad,
    "credentialDetails": credentialDetails,
    "md_do": mdDo,
    "userId": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
