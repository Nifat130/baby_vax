

import 'dart:developer';

import 'package:baby_vax/data/parent_flow/get_my_children_model.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  var isLoading = false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    await getNotification();
    isLoading.value = false;
  }

  var parentHomeController = Get.find<ParentHomeController>();
  var children = <GetMyChildrenModel>[];
  List<Map<String, String>> notificationList = [];

  Future<void> getNotification() async{
    children = parentHomeController.children;
    for (var child in children) {
      final ageInDays = DateTime.now().difference(child.birthDate!.toLocal()).inDays;
      log("cHILD NAME: ${child.name}");
      log(ageInDays.toString());
      for (var vaccine in totalVaccine) {
        if(vaccine["time"] < ageInDays && vaccine["time"] + 7 > ageInDays){
          final notificationBody = {
            "title": "${child.name} needs ${vaccine['name']} Vaccine",
            "subtitle": "As ${child.name} is $ageInDays days old ${child.gender == "Male" ? "he" : "she"} needs ${vaccine['name']} vaccine. Kindly give ${child.gender == "Male" ? "him" : "her"} the vaccine and do not forget to add in note!!",
          };
          notificationList.add(notificationBody);
        }
      }
    }
  }

  final List<Map<String, dynamic>> totalVaccine = [
    {"time": 1, "name": "BCG"},
    {"time": 1, "name": "OPV-0"},
    {"time": 1, "name": "HepB-0"},

    {"time": 42, "name": "OPV-1"},
    {"time": 42, "name": "Pentavalent-1"},
    {"time": 42, "name": "PCV-1"},
    {"time": 42, "name": "Rota-1"},

    {"time": 70, "name": "OPV-2"},
    {"time": 70, "name": "Pentavalent-2"},
    {"time": 70, "name": "PCV-2"},
    {"time": 70, "name": "Rota-2"},

    {"time": 98, "name": "OPV-3"},
    {"time": 98, "name": "IPV"},
    {"time": 98, "name": "Pentavalent-3"},
    {"time": 98, "name": "PCV-3"},
    {"time": 98, "name": "Rota-3"},

    {"time": 270, "name": "MR-1"},

    {"time": 450, "name": "MR-2"},
    {"time": 450, "name": "DPT Booster-1"},
    {"time": 450, "name": "IPV Booster"},

    {"time": 540, "name": "DPT Booster-2"},
    {"time": 540, "name": "Typhoid Vaccine"},

    {"time": 1460, "name": "DPT Booster-2"},
  ];

}