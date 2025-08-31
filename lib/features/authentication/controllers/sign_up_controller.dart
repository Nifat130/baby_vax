
import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/repositories/authentication_repository/authentication_repo.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController{

  final authRepoObject = AuthenticationRepo();
  var selectedRole = ''.obs;

  final parentName = TextEditingController();
  final parentEmail = TextEditingController();
  final parentPass = TextEditingController();
  final parentConfirmPass = TextEditingController();
  final parentAddress = TextEditingController();
  var profileImage = ''.obs;

  void profileImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      profileImage.value = image.path;
    }
  }

  var licensesImage = ''.obs;

  void licenseImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      licensesImage.value = image.path;
    }
  }
  var passVisibility = false.obs;
  var confirmPassVisibility = false.obs;
  final hospitalName = TextEditingController();
  final hospitalEmail = TextEditingController();
  final hospitalPass = TextEditingController();
  final hospitalConfirmPass = TextEditingController();
  final hospitalAddress = TextEditingController();

  void createHospitalAccount() async{

    try{
      final location = await locationFromAddress(hospitalAddress.text);
      final lat = location.first.latitude;
      final long = location.first.longitude;

      final requestBody = {
        "hospitalEmail": hospitalEmail.text,
        "password": hospitalPass.text,
        "hospitalName": hospitalName.text,
        "hospitalAddress": {
          "lat": lat,
          "long": long,
          "fullAddress": hospitalAddress.text
        },
        "hospitalProfilePicture": profileImage.value,
        "hospitalLicenseImage": licensesImage.value
      };

      log(requestBody.toString());
      if(await authRepoObject.createHospitalProfile(requestBody)){
        Get.offAllNamed(AppRoute.signInScreen);
      }
    }catch(e){
      AppSnackBar.showError("Invalid address");
      log(e.toString());
    }
  }
}