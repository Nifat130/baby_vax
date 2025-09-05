// To parse this JSON data, do
//
//     final getHospitalInformationModel = getHospitalInformationModelFromJson(jsonString);

import 'dart:convert';

GetHospitalInformationModel getHospitalInformationModelFromJson(String str) => GetHospitalInformationModel.fromJson(json.decode(str));

String getHospitalInformationModelToJson(GetHospitalInformationModel data) => json.encode(data.toJson());

class GetHospitalInformationModel {
  String? id;
  String? email;
  String? password;
  String? role;
  ProfileDetails? profileDetails;

  GetHospitalInformationModel({
    this.id,
    this.email,
    this.password,
    this.role,
    this.profileDetails,
  });

  factory GetHospitalInformationModel.fromJson(Map<String, dynamic> json) => GetHospitalInformationModel(
    id: json["id"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    profileDetails: json["profileDetails"] == null ? null : ProfileDetails.fromJson(json["profileDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
    "role": role,
    "profileDetails": profileDetails?.toJson(),
  };
}

class ProfileDetails {
  String? hospitalName;
  HospitalAddress? hospitalAddress;
  String? hospitalProfilePicture;
  String? hospitalLicenseImage;

  ProfileDetails({
    this.hospitalName,
    this.hospitalAddress,
    this.hospitalProfilePicture,
    this.hospitalLicenseImage,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    hospitalName: json["hospitalName"],
    hospitalAddress: json["hospitalAddress"] == null ? null : HospitalAddress.fromJson(json["hospitalAddress"]),
    hospitalProfilePicture: json["hospitalProfilePicture"],
    hospitalLicenseImage: json["hospitalLicenseImage"],
  );

  Map<String, dynamic> toJson() => {
    "hospitalName": hospitalName,
    "hospitalAddress": hospitalAddress?.toJson(),
    "hospitalProfilePicture": hospitalProfilePicture,
    "hospitalLicenseImage": hospitalLicenseImage,
  };
}

class HospitalAddress {
  double? lat;
  double? long;
  String? fullAddress;

  HospitalAddress({
    this.lat,
    this.long,
    this.fullAddress,
  });

  factory HospitalAddress.fromJson(Map<String, dynamic> json) => HospitalAddress(
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
