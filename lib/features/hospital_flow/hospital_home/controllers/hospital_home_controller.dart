

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/custom_picker_theme.dart';
import 'package:baby_vax/data/hospital_flow/get_hospital_information_model.dart';
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
  final vaccineType = [
    "Children",
    "Adult",
  ];
  var selectedVaccineType = 'Children'.obs;

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
        return Theme(data: customPickerTheme(context), child: child!);
      }
    );
    if(date != null){
      eventDate.text = DateFormat("dd MMM, yyyy").format(date);
    }
  }

  void pickTime(BuildContext context, String indicator) async{
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if(time != null){
      indicator == "Start" ?
      eventStart.text = DateFormat("hh:mm a").format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute)) :
      eventEnd.text = DateFormat("hh:mm a").format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute)) ;
    }
  }

  var profileIsLoading = false.obs;
  var myInformation = GetHospitalInformationModel();
  var hospitalRepo = HospitalRepo();

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
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
}