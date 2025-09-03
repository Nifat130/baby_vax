
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

  Future<void> uploadFacilityImages() async {
    try {
      final profileFilePath =
          "hospital/${hospitalEmail.text}/profile_picture/profile_picture.png";
      final licenseFilePath =
          "hospital/${hospitalEmail.text}/license_picture/license_picture.png";
      // Upload profile image
      await Supabase.instance.client.storage
          .from("user_pictures") // ✅ make sure bucket name matches
          .upload(profileFilePath, File(profileImage.value),
          fileOptions: const FileOptions(upsert: true));

      profileUrl = Supabase.instance.client.storage
          .from('user_pictures')
          .getPublicUrl(profileFilePath);

      // Upload license image
      await Supabase.instance.client.storage
          .from("user_pictures")
          .upload(licenseFilePath, File(licensesImage.value),
          fileOptions: const FileOptions(upsert: true));

      licenseUrl = Supabase.instance.client.storage
          .from('user_pictures')
          .getPublicUrl(licenseFilePath);

      log("✅ Profile URL: $profileUrl");
      log("✅ License URL: $licenseUrl");
    } catch (e) {
      log("❌ Upload error: $e");
    }
  }

  void createHospitalAccount() async{

    try{
      showProgressIndicator();
      final location = await locationFromAddress(hospitalAddress.text);
      final lat = location.first.latitude;
      final long = location.first.longitude;
      await uploadFacilityImages();
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
      if(await authRepoObject.createHospitalProfile(requestBody)){
        Get.offAllNamed(AppRoute.signInScreen);
      }
    }catch(e){
      AppSnackBar.showError("Invalid address");
      log(e.toString());
    }
  }
  void createParentAccount() async{

    try{
      final location = await locationFromAddress(parentAddress.text);
      final lat = location.first.latitude;
      final long = location.first.longitude;

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
          "parentProfilePicture": profileImage.value,
          "parentNumber": parentNumber.text,
          'children' : [],
          'schedule' : [],
        }
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