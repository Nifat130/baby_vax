

import 'package:baby_vax/data/parent_flow/get_my_children_model.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  var isLoading = false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getNotification();
  }

  var parentHomeController = Get.find<ParentHomeController>();
  var children = <GetMyChildrenModel>[];
  List<Map<String, String>> notificationList = [];

  Future<void> getNotification() async{

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