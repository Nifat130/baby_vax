

import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/data/hospital_flow/get_events_model.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:get/get.dart';


class ParentScheduleCalendarController extends GetxController{

  var isLoading = false.obs;
  var focusedDay = DateTime.now().obs;
  var scheduledDays = <GetEventsModel>[];
  var myMarkedEventList = [];
  RxList<GetEventsModel> selectedDayEvent = <GetEventsModel>[].obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getMySchedule();
  }
  var parentHomeController = Get.find<ParentHomeController>();
  var parentRepo = ParentRepo();

  Future<void> getMySchedule() async{
    isLoading.value = true;
    selectedDayEvent.value.clear();
    myMarkedEventList = parentHomeController.myInformation.profileDetails!.schedule!;
    if(myMarkedEventList.isNotEmpty){
      final result = await parentRepo.getMyScheduleEvents(myMarkedEventList);
      if(result.isNotEmpty){
        scheduledDays.clear();
        scheduledDays.addAll(result.map((event) => GetEventsModel.fromJson(event)));
      }
      else{
        AppSnackBar.showError("Failed to retrieve event data");
      }
    }
    isLoading.value = false;
  }
  
  void getSelectedDateEvents(){
    selectedDayEvent.value.clear();
    for (var event in scheduledDays) {
      if (event.date!.toLocal().day == focusedDay.value.day && event.date!.toLocal().month == focusedDay.value.month) {
        // Found a scheduled day, return custom styled text
        selectedDayEvent.add(event);
        log(selectedDayEvent.toString());
      }
    }
  }
}