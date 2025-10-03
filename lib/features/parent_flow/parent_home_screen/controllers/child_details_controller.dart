

import 'dart:developer';

import 'package:baby_vax/data/parent_flow/get_my_children_model.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:get/get.dart';

import '../../../../core/common/app_snackber.dart';
import '../../../../core/common/widgets/progress_indicator.dart';
import '../../../../core/utils/logging/logger.dart';
import '../../../../repositories/parent_flow_repositories/parent_repo.dart';

class ChildDetailsScreenController extends GetxController{
  var isLoading = false.obs;
  var child = GetMyChildrenModel();

  var toShow = [].obs;
  var takenVaccines = [].obs;

  final List<Map<String, dynamic>> vaccineList = [
    {
      "time": "At Birth",
      "vaccineNames": [
        {"name": "BCG", "taken": false},
        {"name": "OPV-0", "taken": false},
        {"name": "HepB-0", "taken": false},
      ]
    },
    {
      "time": "6 Weeks",
      "vaccineNames": [
        {"name": "OPV-1", "taken": false},
        {"name": "Pentavalent-1", "taken": false},
        {"name": "PCV-1", "taken": false},
        {"name": "Rota-1", "taken": false},
      ]
    },
    {
      "time": "10 Weeks",
      "vaccineNames": [
        {"name": "OPV-2", "taken": false},
        {"name": "Pentavalent-2", "taken": false},
        {"name": "PCV-2", "taken": false},
        {"name": "Rota-2", "taken": false},
      ]
    },
    {
      "time": "14 Weeks",
      "vaccineNames": [
        {"name": "OPV-3", "taken": false},
        {"name": "IPV", "taken": false},
        {"name": "Pentavalent-3", "taken": false},
        {"name": "PCV-3", "taken": false},
        {"name": "Rota-3", "taken": false}, // if 3-dose schedule used
      ]
    },
    {
      "time": "9 Months",
      "vaccineNames": [
        {"name": "MR-1", "taken": false}, // Measles-Rubella 1st dose
      ]
    },
    {
      "time": "15 Months",
      "vaccineNames": [
        {"name": "MR-2", "taken": false}, // Measles-Rubella 2nd dose
        {"name": "DPT Booster-1", "taken": false},
        {"name": "IPV Booster", "taken": false},
      ]
    },
    {
      "time": "18 Months",
      "vaccineNames": [
        {"name": "DPT Booster-2", "taken": false},
        {"name": "Typhoid Vaccine", "taken": false}, // if included in program
      ]
    },
    {
      "time": "4–5 Years",
      "vaccineNames": [
        {"name": "DPT Booster-2", "taken": false}, // 2nd booster if not already
      ]
    },
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      child = Get.arguments;
      log(child.name.toString());
      log(child.givenVaccines.toString());
      log(child.givenDoses.toString());
      takenVaccines.clear();
      takenVaccines.addAll(child.givenVaccines!);
    }
  }

  var parentHomeController = Get.find<ParentHomeController>();
  var parentRepo = ParentRepo();

  void updateChild() async{
    final requestBody = {
      "givenVaccines": takenVaccines
    };
    AppLoggerHelper.info(requestBody.toString());
    showProgressIndicator();
    if(await parentRepo.updateChild(requestBody, child.id!)){
      await parentHomeController.getMyChildren();
      Get.back();
      Get.back();
      AppSnackBar.showSuccess("Child information updated!!");
    }
    else{
      Get.back();
      AppSnackBar.showError("Failed to update information!!");
    }
  }


}