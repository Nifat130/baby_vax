
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:flutter/cupertino.dart';
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
    profileImage.value = parentController.myInformation.profileDetails!.parentProfilePicture ?? '';
    isLoading.value = false;
  }

}