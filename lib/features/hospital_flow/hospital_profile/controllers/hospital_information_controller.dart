import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/data/hospital_flow/get_hospital_information_model.dart';
import 'package:baby_vax/features/hospital_flow/hospital_profile/controllers/hospital_profile_controller.dart';
import 'package:baby_vax/repositories/authentication_repository/authentication_repo.dart';
import 'package:baby_vax/repositories/hsopital_flow_repositories/hospital_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../hospital_home/controllers/hospital_home_controller.dart';

class HospitalInformationController extends GetxController{

  var isLoading = false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    await getMyInformation();
    isLoading.value = false;
  }
  var profileImage = "".obs;

  void profileImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      profileImage.value = image.path;
    }
  }

  var licensesImage = "".obs;

  void licenseImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      licensesImage.value = image.path;
    }
  }
  var currentPassVisibility = false.obs;
  var passVisibility = false.obs;
  var confirmPassVisibility = false.obs;
  final hospitalName = TextEditingController();
  final hospitalEmail = TextEditingController();
  final hospitalCurrentPass = TextEditingController();
  final hospitalNewPass = TextEditingController();
  final hospitalConfirmPass = TextEditingController();
  final hospitalAddress = TextEditingController();

  String profilePicture = '';
  String licensePicture = '';
  final homeController = Get.find<HospitalHomeController>();
  final profileController = Get.find<HospitalProfileController>();
  var myInformation = GetHospitalInformationModel();
  Future<void> getMyInformation() async{
    myInformation = homeController.myInformation;
    hospitalName.text = myInformation.profileDetails!.hospitalName!;
    hospitalAddress.text = myInformation.profileDetails!.hospitalAddress!.fullAddress!;
    profileImage.value = myInformation.profileDetails!.hospitalProfilePicture!;
    licensesImage.value = myInformation.profileDetails!.hospitalLicenseImage!;
    profilePicture = myInformation.profileDetails!.hospitalProfilePicture!;
    licensePicture = myInformation.profileDetails!.hospitalLicenseImage!;
  }

  final hospitalRepo = HospitalRepo();
  final authRepo = AuthenticationRepo();


  void updateHospitalInfo() async{

    try{
      showProgressIndicator();
      final location = await locationFromAddress(hospitalAddress.text);
      final lat = location.first.latitude;
      final long = location.first.longitude;

      if(!profileImage.value.startsWith('https')){
        final profileFilePath =
            "hospital/${AuthService.email}/profile_picture/profile_picture.png";
        if(!await hospitalRepo.updatePicture(path: profileFilePath, file: profileImage.value)){
          throw Exception();
        }
      }

      if(!licensesImage.value.startsWith('https')){
        final licenseFilePath =
            "hospital/${AuthService.email}/license_picture/license_picture.png";
        if(!await hospitalRepo.updatePicture(path: licenseFilePath, file: licensesImage.value)){
          throw Exception();
        }
      }

      final requestBody = {
        "hospitalName": hospitalName.text,
        "hospitalAddress": {
          "lat": lat,
          "long": long,
          "fullAddress": hospitalAddress.text
        },
        "hospitalProfilePicture": profilePicture,
        "hospitalLicenseImage": licensePicture
      };

      log(requestBody.toString());
      final response = await hospitalRepo.updateHospitalInformation(requestBody);

      if(response!.isEmpty){
        Get.back();
        AppSnackBar.showError("Failed to update!!");
      }
      else{
        await homeController.getMyInformation();
        await profileController.getMyInformation();
        Get.back();
        Get.back();
        AppSnackBar.showSuccess("Successfully updated!!");
      }

    }catch(e){
      AppSnackBar.showError("Failed to update!");
      log("Failed to update");
    }
  }

}