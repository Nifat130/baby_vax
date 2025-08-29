

import 'dart:developer';

import 'package:get/get.dart';

import '../../../../core/utils/constants/image_path.dart';

class ParentScheduleCalendarController extends GetxController{

  var focusedDay = DateTime.now().obs;
  var scheduledDays = [
    {
      "date" : DateTime.now().add(Duration(days: 2)).day,
      "events" : [
        {
          "id": 1,
          "title": "Polio Vaccine For Children",
          "vaccineType": "Polio Vaccine",
          "maxAge": "3 Years",
          "date": "25 Aug, 2025",
          "startTime": "11:00 AM",
          "hospitalName": "Dhaka Hospital",
          "hospitalAddress": "Shewrpara, Mirpur, Dhaka",
          "hospitalImage": ImagePath.dummyProfilePicture,
          "details":
          "The polio vaccine is a safe and essential immunization that protects children from poliomyelitis. It is given as Oral Polio Vaccine (drops) or Inactivated Polio Vaccine (injection).",
        },
        {
          "id": 2,
          "title": "Hepatitis B Vaccine",
          "vaccineType": "Hepatitis B",
          "maxAge": "6 Months",
          "date": "10 Sep, 2025",
          "startTime": "10:30 AM",
          "hospitalName": "Apollo Hospital",
          "hospitalAddress": "Bashundhara, Dhaka",
          "hospitalImage": ImagePath.dummyProfilePicture,
          "details":
          "The hepatitis B vaccine prevents hepatitis B infection, which affects the liver. It is usually given at birth with booster doses for long-term protection.",
        },
      ]
    },
    {
      "date" : DateTime.now().add(Duration(days: 6)).day,
      "events" : [
        {
          "id": 1,
          "title": "Polio Vaccine For Children",
          "vaccineType": "Polio Vaccine",
          "maxAge": "3 Years",
          "date": "25 Aug, 2025",
          "startTime": "11:00 AM",
          "hospitalName": "Dhaka Hospital",
          "hospitalAddress": "Shewrpara, Mirpur, Dhaka",
          "hospitalImage": ImagePath.dummyProfilePicture,
          "details":
          "The polio vaccine is a safe and essential immunization that protects children from poliomyelitis. It is given as Oral Polio Vaccine (drops) or Inactivated Polio Vaccine (injection).",
        },
      ]
    },
    {
      "date" : DateTime.now().add(Duration(days: 15)).day,
      "events" : [
        {
          "id": 1,
          "title": "Polio Vaccine For Children",
          "vaccineType": "Polio Vaccine",
          "maxAge": "3 Years",
          "date": "25 Aug, 2025",
          "startTime": "11:00 AM",
          "hospitalName": "Dhaka Hospital",
          "hospitalAddress": "Shewrpara, Mirpur, Dhaka",
          "hospitalImage": ImagePath.dummyProfilePicture,
          "details":
          "The polio vaccine is a safe and essential immunization that protects children from poliomyelitis. It is given as Oral Polio Vaccine (drops) or Inactivated Polio Vaccine (injection).",
        },
        {
          "id": 2,
          "title": "Hepatitis B Vaccine",
          "vaccineType": "Hepatitis B",
          "maxAge": "6 Months",
          "date": "10 Sep, 2025",
          "startTime": "10:30 AM",
          "hospitalName": "Apollo Hospital",
          "hospitalAddress": "Bashundhara, Dhaka",
          "hospitalImage": ImagePath.dummyProfilePicture,
          "details":
          "The hepatitis B vaccine prevents hepatitis B infection, which affects the liver. It is usually given at birth with booster doses for long-term protection.",
        },
        {
          "id": 3,
          "title": "Hepatitis B Vaccine",
          "vaccineType": "Hepatitis B",
          "maxAge": "6 Months",
          "date": "10 Sep, 2025",
          "startTime": "10:30 AM",
          "hospitalName": "Apollo Hospital",
          "hospitalAddress": "Bashundhara, Dhaka",
          "hospitalImage": ImagePath.dummyProfilePicture,
          "details":
          "The hepatitis B vaccine prevents hepatitis B infection, which affects the liver. It is usually given at birth with booster doses for long-term protection.",
        },
        {
          "id": 4,
          "title": "Hepatitis B Vaccine",
          "vaccineType": "Hepatitis B",
          "maxAge": "6 Months",
          "date": "10 Sep, 2025",
          "startTime": "10:30 AM",
          "hospitalName": "Apollo Hospital",
          "hospitalAddress": "Bashundhara, Dhaka",
          "hospitalImage": ImagePath.dummyProfilePicture,
          "details":
          "The hepatitis B vaccine prevents hepatitis B infection, which affects the liver. It is usually given at birth with booster doses for long-term protection.",
        },
      ]
    },
  ];
  RxList<Map<String, dynamic>> selectedDayEvent = <Map<String, dynamic>>[].obs;


  void getSelectedDateEvents(){
    for (var date in scheduledDays) {
      if (date['date'] == focusedDay.value.day) {
        // Found a scheduled day, return custom styled text
        selectedDayEvent.value = date['events'] as List<Map<String, dynamic>>;
        log(selectedDayEvent.toString());
      }
    }
  }
}