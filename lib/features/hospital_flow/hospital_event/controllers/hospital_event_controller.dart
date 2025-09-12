import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/repositories/hsopital_flow_repositories/hospital_repo.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/image_path.dart';

class HospitalEventController extends GetxController{

  var vaccineEvents = [
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
      "title": "MMR Vaccine",
      "vaccineType": "Measles, Mumps, Rubella",
      "maxAge": "5 Years",
      "date": "15 Oct, 2025",
      "startTime": "09:00 AM",
      "hospitalName": "Square Hospital",
      "hospitalAddress": "Panthapath, Dhaka",
      "hospitalImage": ImagePath.dummyProfilePicture,
      "details":
      "The MMR vaccine protects against measles, mumps, and rubella. It is usually given in two doses during early childhood.",
    },
    {
      "id": 4,
      "title": "BCG Vaccine",
      "vaccineType": "BCG",
      "maxAge": "Birth",
      "date": "05 Nov, 2025",
      "startTime": "01:00 PM",
      "hospitalName": "United Hospital",
      "hospitalAddress": "Gulshan, Dhaka",
      "hospitalImage": ImagePath.dummyProfilePicture,
      "details":
      "The BCG vaccine protects infants against tuberculosis (TB). It is given soon after birth, especially in countries with high TB prevalence.",
    },
    {
      "id": 5,
      "title": "DTP Vaccine",
      "vaccineType": "Diphtheria, Tetanus, Pertussis",
      "maxAge": "7 Years",
      "date": "20 Nov, 2025",
      "startTime": "02:30 PM",
      "hospitalName": "Ibn Sina Hospital",
      "hospitalAddress": "Dhanmondi, Dhaka",
      "hospitalImage": ImagePath.dummyProfilePicture,
      "details":
      "The DTP vaccine protects against diphtheria, tetanus, and pertussis (whooping cough). It is given in multiple doses starting at 6 weeks of age.",
    },
    {
      "id": 6,
      "title": "Rotavirus Vaccine",
      "vaccineType": "Rotavirus",
      "maxAge": "8 Months",
      "date": "01 Dec, 2025",
      "startTime": "10:00 AM",
      "hospitalName": "Labaid Hospital",
      "hospitalAddress": "Dhanmondi, Dhaka",
      "hospitalImage": ImagePath.dummyProfilePicture,
      "details":
      "The rotavirus vaccine protects against severe diarrhea and dehydration caused by rotavirus. It is given orally in multiple doses to infants.",
    },
    {
      "id": 7,
      "title": "Chickenpox Vaccine",
      "vaccineType": "Varicella",
      "maxAge": "12 Years",
      "date": "15 Dec, 2025",
      "startTime": "11:30 AM",
      "hospitalName": "Popular Hospital",
      "hospitalAddress": "Shyamoli, Dhaka",
      "hospitalImage": ImagePath.dummyProfilePicture,
      "details":
      "The chickenpox vaccine protects against varicella infection, a highly contagious disease. It is given in two doses for lasting protection.",
    },
  ].obs;
  var isLoading = false.obs;

  var hospitalRepo = HospitalRepo();
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getMyEvents();
  }

  var myEvents = [].obs;
  Future<void> getMyEvents() async{
    isLoading.value = true;
    final result = await hospitalRepo.getMyEvents();
    if(result.isNotEmpty){
      myEvents.value = result;
    }
    else{
      AppSnackBar.showError("Failed to retrieve data mahin");
    }
    isLoading.value = false;
  }

  void deleteEvent({required String eventId}) async{

    if(await hospitalRepo.deleteEvent(eventId)){
      AppSnackBar.showSuccess("Event deleted successfully!");
      await getMyEvents();
    }
    else{
      AppSnackBar.showSuccess("Failed to deleted event!!");
    }
  }



}