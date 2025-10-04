// To parse this JSON data, do
//
//     final getMyChildrenModel = getMyChildrenModelFromJson(jsonString);

import 'dart:convert';

GetMyChildrenModel getMyChildrenModelFromJson(String str) => GetMyChildrenModel.fromJson(json.decode(str));

String getMyChildrenModelToJson(GetMyChildrenModel data) => json.encode(data.toJson());

class GetMyChildrenModel {
  String? id;
  String? parentId;
  String? name;
  DateTime? birthDate;
  String? gender;
  String? birthPlace;
  String? profilePicture;
  String? fatherName;
  String? motherName;
  List<dynamic>? givenVaccines;
  List<GivenDose>? givenDoses;

  GetMyChildrenModel({
    this.id,
    this.parentId,
    this.name,
    this.birthDate,
    this.gender,
    this.birthPlace,
    this.profilePicture,
    this.fatherName,
    this.motherName,
    this.givenVaccines,
    this.givenDoses,
  });

  factory GetMyChildrenModel.fromJson(Map<String, dynamic> json) => GetMyChildrenModel(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
    gender: json["gender"],
    birthPlace: json["birthPlace"],
    profilePicture: json["profilePicture"],
    fatherName: json["fatherName"],
    motherName: json["motherName"],
    givenVaccines: json["givenVaccines"] == null ? [] : List<String>.from(json["givenVaccines"]!.map((x) => x)),
    givenDoses: json["givenDoses"] == null ? [] : List<GivenDose>.from(json["givenDoses"]!.map((x) => GivenDose.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "birthDate": birthDate?.toIso8601String(),
    "gender": gender,
    "birthPlace": birthPlace,
    "profilePicture": profilePicture,
    "fatherName": fatherName,
    "motherName": motherName,
    "givenVaccines": givenVaccines == null ? [] : List<dynamic>.from(givenVaccines!.map((x) => x)),
    "givenDoses": givenDoses == null ? [] : List<dynamic>.from(givenDoses!.map((x) => x.toJson())),
  };
}

class GivenDose {
  String? doseTime;
  String? givenDate;

  GivenDose({
    this.doseTime,
    this.givenDate,
  });

  factory GivenDose.fromJson(Map<String, dynamic> json) => GivenDose(
    doseTime: json["doseTime"],
    givenDate: json["givenDate"],
  );

  Map<String, dynamic> toJson() => {
    "doseTime": doseTime,
    "givenDate": givenDate,
  };
}
