

import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/custom_picker_theme.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:baby_vax/data/parent_flow/get_my_children_model.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../core/services/Auth_service.dart';

class EditChildController extends GetxController{

  final childNameTEController = TextEditingController();
  final dateOfBirthTEController = TextEditingController();
  final fartherNameTEController = TextEditingController();
  final motherNameTEController = TextEditingController();
  final birthPlaceTEController = TextEditingController();
  var selectedGender = 'Male'.obs;
  List<String> genderList = ["Male", "Female"];
  var child = GetMyChildrenModel();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      child = Get.arguments;
      childNameTEController.text = child.name!;
      birthDate = child.birthDate!.toString();
      dateOfBirthTEController.text = DateFormat("dd MMMM, yyyy").format(child.birthDate!.toLocal());
      fartherNameTEController.text = child.fatherName!;
      motherNameTEController.text = child.motherName!;
      birthPlaceTEController.text = child.birthPlace!;
      profileImage.value = child.profilePicture!;
    }
  }
  var birthDate = "";
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
      birthDate = date.toUtc().toIso8601String();
    }
  }

  var profileImage = "".obs;

  void profileImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      profileImage.value = image.path;
    }
  }

  var parentHomeController = Get.find<ParentHomeController>();
  var parentRepo = ParentRepo();

  void updateChild() async{
    final requestBody = {
      "parent_id": AuthService.id,
      "name": childNameTEController.text,
      "birthDate": birthDate,
      "gender": selectedGender.value,
      "birthPlace": birthPlaceTEController.text,
      "profilePicture": child.profilePicture,
      "fatherName": fartherNameTEController.text,
      "motherName": motherNameTEController.text,
      "givenVaccines": child.givenVaccines
    };
    AppLoggerHelper.info(requestBody.toString());
    showProgressIndicator();
    if(await parentRepo.updateChild(requestBody, child.id!)){
      await parentHomeController.getMyChildren();
      Get.back();
      Get.back();
      AppSnackBar.showSuccess("Child information updated!!");
    }
    else{
      Get.back();
      AppSnackBar.showError("Failed to update information!!");
    }
  }

  void removeChild(String childId) async {
    try {
      showProgressIndicator();

      final response = await parentRepo.removeChild(childId);

      if (response) {
        Get.back(); // close loader
        Get.back(); // go back one screen (like in addChild)
        AppSnackBar.showSuccess("Child removed successfully");
        await parentHomeController.getMyChildren();
      } else {
        Get.back();
        AppSnackBar.showError("Failed to remove child!!");
      }
    } catch (e) {
      Get.back();
      log("❌ removeChild error: $e");
      AppSnackBar.showError("Failed to remove child!!");
    }
  }

}