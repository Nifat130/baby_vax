import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:baby_vax/data/hospital_flow/get_parent_information_model.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:get/get.dart';

import '../../../../data/hospital_flow/get_events_model.dart';


class ParentEventDetailsController extends GetxController{

  var isAssigned = false.obs;
  var isLoading = false.obs;

  var event = GetEventsModel();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    if(Get.arguments != null){
      event = Get.arguments;
      await checkIfAssigned();
    }
    isLoading.value = false;
  }
  var schedule = [];
  var myInformation = GetParentInformationModel();
  var parentHomeController = Get.find<ParentHomeController>();
  Future<void> checkIfAssigned() async{
    myInformation = parentHomeController.myInformation;
    schedule = myInformation.profileDetails!.schedule!;
    if(schedule.contains(event.id)){
      isAssigned.value = true;
    }
  }

  var parentRepo = ParentRepo();
  void updateParentSchedule() async{
    showProgressIndicator();

    final profileDetails = myInformation.profileDetails!;
    isAssigned.value ?
        schedule.remove(event.id) :
        schedule.add(event.id);
    final requestBody = {
      "parentName": profileDetails.parentName,
      "parentAddress": {
        "lat": profileDetails.parentAddress!.lat,
        "long": profileDetails.parentAddress!.long,
        "fullAddress": profileDetails.parentAddress!.fullAddress
      },
      "parentProfilePicture": profileDetails.parentProfilePicture,
      "parentNumber": profileDetails.parentNumber,
      "children": profileDetails.children,
      "schedule": schedule
    };

    log(requestBody.toString());

    final result = await parentRepo.updateParent(requestBody);
    if(result){
      Get.back();
      isAssigned.value = !isAssigned.value;
      isAssigned.value ?
          AppSnackBar.showSuccess("Added to the schedule") :
          AppSnackBar.showSuccess("Removed from schedule");
    }
    else{
      Get.back();
      isAssigned.value ?
      AppSnackBar.showError("Failed to remove") :
      AppSnackBar.showError("Failed to add");
      AppLoggerHelper.error(result.toString());
    }
  }
}