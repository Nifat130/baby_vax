

import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/custom_picker_theme.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddChildController extends GetxController{

  final childNameTEController = TextEditingController();
  final dateOfBirthTEController = TextEditingController();
  final fartherNameTEController = TextEditingController();
  final motherNameTEController = TextEditingController();
  final birthPlaceTEController = TextEditingController();
  var selectedGender = 'Male'.obs;
  var birthdate = '';
  List<String> genderList = ["Male", "Female"];

  void pickDOB(BuildContext context) async{
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 18),
      lastDate: DateTime.now(),
      builder: (context, child){
        return customPickerTheme(context, child!);
      }
    );

    if(date != null){
      dateOfBirthTEController.text = DateFormat("dd MMMM, yyyy").format(date);
      birthdate = date.toUtc().toIso8601String();
    }
  }

  var profileImage = "".obs;

  void profileImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      profileImage.value = image.path;
    }
  }

  var parentRepo = ParentRepo();
  var parentHomeController = Get.find<ParentHomeController>();

  void addChild() async{
    try{
      showProgressIndicator();
      final childProfileFilePath =
          "parent/${AuthService.email}/children/children_profile_picture/${childNameTEController.text}.png";

      final result = await parentRepo.uploadChildrenPicture(path: childProfileFilePath, file: profileImage.value);

      if(result != 'failed'){
        final requestBody = {
          "parent_id": AuthService.id,
          "name": childNameTEController.text,
          "birthDate": birthdate,
          "gender": selectedGender.value,
          "birthPlace": birthPlaceTEController.text,
          "profilePicture": result,
          "fatherName": fartherNameTEController.text,
          "motherName": motherNameTEController.text,
          "givenVaccines": [],
          "givenDoses": [],
        };
        log("=======================================================");
        log(requestBody.toString());
        final response = await parentRepo.addChild(requestBody);
        if(response){
          await parentHomeController.getMyChildren();
          Get.back();
          Get.back();
          AppSnackBar.showSuccess("Child added successfully");
        }
        else{
          Get.back();
          AppSnackBar.showError("Failed to add a new child!!");
        }
      }
      else{
        Get.back();
        AppSnackBar.showError("Failed to add a new child!!");
      }

    }catch(e){
      Get.back();
      log(e.toString());
      AppSnackBar.showError("Failed to add a new child!!");
    }
  }
}