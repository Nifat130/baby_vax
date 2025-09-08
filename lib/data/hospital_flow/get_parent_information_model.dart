// To parse this JSON data, do
//
//     final getParentInformationModel = getParentInformationModelFromJson(jsonString);

import 'dart:convert';

GetParentInformationModel getParentInformationModelFromJson(String str) => GetParentInformationModel.fromJson(json.decode(str));

String getParentInformationModelToJson(GetParentInformationModel data) => json.encode(data.toJson());

class GetParentInformationModel {
  String? email;
  String? password;
  String? role;
  ProfileDetails? profileDetails;

  GetParentInformationModel({
    this.email,
    this.password,
    this.role,
    this.profileDetails,
  });

  factory GetParentInformationModel.fromJson(Map<String, dynamic> json) => GetParentInformationModel(
    email: json["email"],
    password: json["password"],
    role: json["role"],
    profileDetails: json["profileDetails"] == null ? null : ProfileDetails.fromJson(json["profileDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "role": role,
    "profileDetails": profileDetails?.toJson(),
  };
}

class ProfileDetails {
  String? parentName;
  ParentAddress? parentAddress;
  String? parentProfilePicture;
  String? parentNumber;
  List<String>? children;
  List<String>? schedule;

  ProfileDetails({
    this.parentName,
    this.parentAddress,
    this.parentProfilePicture,
    this.parentNumber,
    this.children,
    this.schedule,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    parentName: json["parentName"],
    parentAddress: json["parentAddress"] == null ? null : ParentAddress.fromJson(json["parentAddress"]),
    parentProfilePicture: json["parentProfilePicture"],
    parentNumber: json["parentNumber"],
    children: json["children"] == null ? [] : List<String>.from(json["children"]!.map((x) => x)),
    schedule: json["schedule"] == null ? [] : List<String>.from(json["schedule"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "parentName": parentName,
    "parentAddress": parentAddress?.toJson(),
    "parentProfilePicture": parentProfilePicture,
    "parentNumber": parentNumber,
    "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
    "schedule": schedule == null ? [] : List<dynamic>.from(schedule!.map((x) => x)),
  };
}

class ParentAddress {
  double? lat;
  double? long;
  String? fullAddress;

  ParentAddress({
    this.lat,
    this.long,
    this.fullAddress,
  });

  factory ParentAddress.fromJson(Map<String, dynamic> json) => ParentAddress(
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    fullAddress: json["fullAddress"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
    "fullAddress": fullAddress,
  };
}
