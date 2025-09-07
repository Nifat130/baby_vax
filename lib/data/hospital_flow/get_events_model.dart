// To parse this JSON data, do
//
//     final getEventsModel = getEventsModelFromJson(jsonString);

import 'dart:convert';

List<GetEventsModel> getEventsModelFromJson(String str) => List<GetEventsModel>.from(json.decode(str).map((x) => GetEventsModel.fromJson(x)));

String getEventsModelToJson(List<GetEventsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetEventsModel {
  String? id;
  String? name;
  String? type;
  String? age;
  DateTime? date;
  DateTime? startTime;
  DateTime? endTime;
  String? inChargeName;
  String? inChargeContact;
  String? description;
  HospitalInfo? hospitalInfo;
  String? hospitalId;

  GetEventsModel({
    this.id,
    this.name,
    this.type,
    this.age,
    this.date,
    this.startTime,
    this.endTime,
    this.inChargeName,
    this.inChargeContact,
    this.description,
    this.hospitalInfo,
    this.hospitalId,
  });

  factory GetEventsModel.fromJson(Map<String, dynamic> json) => GetEventsModel(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    age: json["age"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
    inChargeName: json["inChargeName"],
    inChargeContact: json["inChargeContact"],
    description: json["description"],
    hospitalInfo: json["hospitalInfo"] == null ? null : HospitalInfo.fromJson(json["hospitalInfo"]),
    hospitalId: json["hospitalID"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "age": age,
    "date": date?.toIso8601String(),
    "startTime": startTime?.toIso8601String(),
    "endTime": endTime?.toIso8601String(),
    "inChargeName": inChargeName,
    "inChargeContact": inChargeContact,
    "description": description,
    "hospitalInfo": hospitalInfo?.toJson(),
    "hospitalID": hospitalId,
  };
}

class HospitalInfo {
  String? hospitalName;
  String? hospitalAddress;
  String? hospitalPicture;

  HospitalInfo({
    this.hospitalName,
    this.hospitalAddress,
    this.hospitalPicture,
  });

  factory HospitalInfo.fromJson(Map<String, dynamic> json) => HospitalInfo(
    hospitalName: json["hospitalName"],
    hospitalAddress: json["hospitalAddress"],
    hospitalPicture: json["hospitalPicture"],
  );

  Map<String, dynamic> toJson() => {
    "hospitalName": hospitalName,
    "hospitalAddress": hospitalAddress,
    "hospitalPicture": hospitalPicture,
  };
}
