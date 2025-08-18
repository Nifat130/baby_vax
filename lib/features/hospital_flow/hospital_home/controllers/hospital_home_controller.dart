

import 'package:baby_vax/core/common/widgets/custom_picker_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
}