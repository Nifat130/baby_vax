// To parse this JSON data, do
//
//     final getMyChildrenModel = getMyChildrenModelFromJson(jsonString);

import 'dart:convert';

List<GetMyChildrenModel> getMyChildrenModelFromJson(String str) => List<GetMyChildrenModel>.from(json.decode(str).map((x) => GetMyChildrenModel.fromJson(x)));

String getMyChildrenModelToJson(List<GetMyChildrenModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
    givenVaccines: json["givenVaccines"] == null ? [] : List<dynamic>.from(json["givenVaccines"]!.map((x) => x)),
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
  };
}
