
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:typed_data/typed_data.dart';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/repositories/authentication_repository/authentication_repo.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController{

  final authRepoObject = AuthenticationRepo();
  var selectedRole = ''.obs;

  final parentName = TextEditingController();
  final parentEmail = TextEditingController();
  final parentNumber = TextEditingController();
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
  String profileUrl = '';
  String licenseUrl = '';


  void createHospitalAccount() async{

    final profileFilePath =
        "hospital/${hospitalEmail.text}/profile_picture/profile_picture.png";
    final licenseFilePath =
        "hospital/${hospitalEmail.text}/license_picture/license_picture.png";
    try{
      showProgressIndicator();
      final location = await locationFromAddress(hospitalAddress.text);
      final lat = location.first.latitude;
      final long = location.first.longitude;
      profileUrl = await authRepoObject.uploadProfilePicture(path: profileFilePath, file: profileImage.value);
      licenseUrl = await authRepoObject.uploadProfilePicture(path: licenseFilePath, file: profileImage.value);
      if(profileUrl != 'failed' && licenseUrl != 'failed'){
        final requestBody = {
          "email": hospitalEmail.text,
          "password": hospitalPass.text,
          "role": "HOSPITAL",
          'profileDetails' : {
            "hospitalName": hospitalName.text,
            "hospitalAddress": {
              "lat": lat,
              "long": long,
              "fullAddress": hospitalAddress.text
            },
            "hospitalProfilePicture": profileUrl,
            "hospitalLicenseImage": licenseUrl
          }
        };

        log(requestBody.toString());
        if(await authRepoObject.createAccount(requestBody)){
          Get.until((route) => route.isFirst);
        }
      }
      else{
        AppSnackBar.showError("Failed to register!!");
        log("profileUrl: $profileUrl, licenseUrl: $licenseUrl");
      }
    }catch(e){
      AppSnackBar.showError("Invalid address");
      log(e.toString());
    }
  }
  void createParentAccount() async{
    final profileFilePath =
        "parent/${parentEmail.text}/profile_picture/profile_picture.png";
    try{
      showProgressIndicator();
      final location = await locationFromAddress(parentAddress.text);
      final lat = location.first.latitude;
      final long = location.first.longitude;
      profileUrl = await authRepoObject.uploadProfilePicture(path: profileFilePath, file: profileImage.value);
      if(profileUrl != 'failed'){
        final requestBody = {
          "email": parentEmail.text,
          "password": parentPass.text,
          "role": "PARENT",
          'profileDetails' : {
            "parentName": parentName.text,
            "parentAddress": {
              "lat": lat,
              "long": long,
              "fullAddress": parentAddress.text
            },
            "parentProfilePicture": profileUrl,
            "parentNumber": parentNumber.text,
            'children' : [],
            'schedule' : [],
          }
        };
        log(requestBody.toString());
        if(await authRepoObject.createAccount(requestBody)){
          Get.until((route) => route.isFirst);
        }
      }
      else{
        AppSnackBar.showError("Failed to register!!");
        log("profileUrl: $profileUrl");
      }
    }catch(e){
      AppSnackBar.showError("Invalid address");
      log(e.toString());
    }
  }
}