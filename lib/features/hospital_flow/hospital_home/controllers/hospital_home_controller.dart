

import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/custom_picker_theme.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/data/hospital_flow/get_hospital_information_model.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/controllers/hospital_event_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../repositories/hsopital_flow_repositories/hospital_repo.dart';

class HospitalHomeController extends GetxController{
  final vaccineName = TextEditingController();
  final eventDate = TextEditingController();
  final eventStart = TextEditingController();
  final eventEnd = TextEditingController();
  final inChargeName = TextEditingController();
  final inChargeContact = TextEditingController();
  final eventDescription = TextEditingController();
  final List<String> vaccineType = [
    "BCG", "OPV-0", "HepB-0",
    "OPV-1", "Pentavalent-1", "PCV-1", "Rota-1",
    "OPV-2", "Pentavalent-2", "PCV-2", "Rota-2",
    "OPV-3", "IPV", "Pentavalent-3", "PCV-3", "Rota-3",
    "MR-1",
    "MR-2", "DPT Booster-1", "IPV Booster",
    "DPT Booster-2", "Typhoid Vaccine",
    "DPT Booster-2"
  ];

  final Map<String, String> vaccineTime = {
    "BCG": "At Birth",
    "OPV-0": "At Birth",
    "HepB-0": "At Birth",
    "OPV-1": "6 Weeks",
    "Pentavalent-1": "6 Weeks",
    "PCV-1": "6 Weeks",
    "Rota-1": "6 Weeks",
    "OPV-2": "10 Weeks",
    "Pentavalent-2": "10 Weeks",
    "PCV-2": "10 Weeks",
    "Rota-2": "10 Weeks",
    "OPV-3": "14 Weeks",
    "IPV": "14 Weeks",
    "Pentavalent-3": "14 Weeks",
    "PCV-3": "14 Weeks",
    "Rota-3": "14 Weeks",
    "MR-1": "9 Months",
    "MR-2": "15 Months",
    "DPT Booster-1": "15 Months",
    "IPV Booster": "15 Months",
    "DPT Booster-2": "4–5 Years", // overwrites "18 Months"
    "Typhoid Vaccine": "18 Months"
  };
  var selectedVaccineType = 'BCG'.obs;
  var dateISO = '';
  var startTimeISO = '';
  var endTimeISO = '';
  final maxAge = TextEditingController();
  var ageUnit = [
    'Weeks',
    'Months',
    "Years"
  ];
  var selectedAgeUnit = 'Weeks'.obs;

  void pickDate(BuildContext context) async{
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child){
        return customPickerTheme(context, child!);
      }
    );
    if(date != null){
      eventDate.text = DateFormat("dd MMM, yyyy").format(date);
      dateISO = date.toUtc().toIso8601String();
    }
  }

  void pickTime(BuildContext context, String indicator) async{
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
        builder: (context, child){
          return customPickerTheme(context, child!);
        }
    );
    if(time != null){
      final now = DateTime.parse(dateISO).toLocal();

      // Combine today's date with picked time
      final dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      indicator == "Start" ?
      eventStart.text = DateFormat("hh:mm a").format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute)) :
      eventEnd.text = DateFormat("hh:mm a").format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute)) ;

      indicator == "Start" ?
          startTimeISO = dateTime.toUtc().toIso8601String() :
          endTimeISO = dateTime.toUtc().toIso8601String() ;
    }
  }

  var profileIsLoading = false.obs;
  var myInformation = GetHospitalInformationModel();
  var hospitalRepo = HospitalRepo();
  var hospitalEventController = Get.find<HospitalEventController>();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    maxAge.text = vaccineTime[selectedVaccineType.value]!;
    await getMyInformation();
  }

  Future<void> getMyInformation() async{
    profileIsLoading.value = true;
    final dataList = await hospitalRepo.getMeAsHospital();
    if(dataList.isNotEmpty){
      myInformation = GetHospitalInformationModel.fromJson(dataList[0]);
    }
    else{
      AppSnackBar.showError('Failed to fetch data!');
    }
    profileIsLoading.value = false;
  }

  Future<void> createEvent() async{
    final requestBody = {
      "hospitalID" : AuthService.id,
      "hospitalInfo" : {
        "hospitalName" : myInformation.profileDetails!.hospitalName,
        "hospitalAddress" : myInformation.profileDetails!.hospitalAddress!.fullAddress,
        "hospitalPicture" : myInformation.profileDetails!.hospitalProfilePicture,
      },
      "name" : vaccineName.text,
      "type" : selectedVaccineType.value,
      "age" : maxAge.text,
      "date" : dateISO,
      "startTime" : startTimeISO,
      "endTime" : endTimeISO,
      "inChargeName" : inChargeName.text,
      "inChargeContact" : inChargeContact.text,
      "description" : eventDescription.text,
    };
    log(requestBody.toString());
    showProgressIndicator();
    if(await hospitalRepo.createEvent(requestBody)){
      // refresh event screen
      await hospitalEventController.getMyEvents();
      vaccineName.clear();
      eventDate.clear();
      eventStart.clear();
      eventEnd.clear();
      inChargeName.clear();
      inChargeContact.clear();
      eventDescription.clear();
    }
  }
}