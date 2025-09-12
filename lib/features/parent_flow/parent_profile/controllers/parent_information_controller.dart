
import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:baby_vax/features/parent_flow/parent_profile/controllers/parent_profile_controller.dart';
import 'package:baby_vax/repositories/parent_flow_repositories/parent_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../parent_home_screen/controllers/parent_home_controller.dart';

class ParentInformationController extends GetxController{

  var isLoading = false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getMyInformation();

  }
  var profileImage = "".obs;

  void profileImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      profileImage.value = image.path;
    }
  }

  var currentPassVisibility = false.obs;
  var passVisibility = false.obs;
  var confirmPassVisibility = false.obs;
  final parentName = TextEditingController(text: "Abdullah Talukdar");
  final parentNumber = TextEditingController(text: "01565555555");
  final parentCurrentPass = TextEditingController();
  final parentNewPass = TextEditingController();
  final parentConfirmPass = TextEditingController();
  final parentAddress = TextEditingController(text: "Mirpur, Dhaka, Bangladesh");

  final parentController = Get.find<ParentHomeController>();
  Future<void> getMyInformation() async{
    isLoading.value = true;
    parentName.text = parentController.myInformation.profileDetails!.parentName ?? 'Unknown';
    parentNumber.text = parentController.myInformation.profileDetails!.parentNumber ?? 'Unknown';
    parentAddress.text = parentController.myInformation.profileDetails!.parentAddress!.fullAddress ?? 'Unknown';
    profileImage.value = parentController.myInformation.profileDetails!.parentProfilePicture ?? '';
    isLoading.value = false;
  }
  var parentRepo = ParentRepo();
  final parentHomeController = Get.find<ParentHomeController>();
  final parentProfileController = Get.find<ParentProfileController>();

  void updateParent() async{
    try{
      showProgressIndicator();
      final location = await locationFromAddress(parentAddress.text);
      final requestBody = {
        "parentName": parentName.text,
        "parentAddress": {
          "lat": location.first.latitude,
          "long": location.first.longitude,
          "fullAddress": parentAddress.text
        },
        "parentProfilePicture": parentController.myInformation.profileDetails!.parentProfilePicture,
        "parentNumber": parentNumber.text,
        "children": parentController.myInformation.profileDetails!.children,
        "schedule": parentController.myInformation.profileDetails!.schedule
      };

      log(requestBody.toString());
      final result = await parentRepo.updateParent(requestBody);
      if(result){
        await parentHomeController.getMyInformation();
        await parentProfileController.getMyInformation();
        Get.back();
        AppSnackBar.showSuccess("Profile updated successfully!!");
      }
      else{
        Get.back();
        AppSnackBar.showError("Failed to updated profile!!");
        AppLoggerHelper.error(result.toString());
      }
    }catch(error){
      Get.back();
      AppSnackBar.showError("No such location");
      AppLoggerHelper.error(error.toString());
    }
  }


}