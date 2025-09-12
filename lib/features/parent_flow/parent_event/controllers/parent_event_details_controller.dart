import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
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
  var parentHomeController = Get.find<ParentHomeController>();
  Future<void> checkIfAssigned() async{
    schedule = parentHomeController.myInformation.profileDetails!.schedule!;
    if(schedule.contains(event.id)){
      isAssigned.value = true;
    }
  }
}