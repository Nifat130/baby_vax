import 'package:baby_vax/data/hospital_flow/get_hospital_information_model.dart';
import 'package:flutter/cupertino.dart';
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

  final homeController = Get.find<HospitalHomeController>();
  var myInformation = GetHospitalInformationModel();
  Future<void> getMyInformation() async{
    myInformation = homeController.myInformation;
    hospitalName.text = myInformation.profileDetails!.hospitalName!;
    hospitalAddress.text = myInformation.profileDetails!.hospitalAddress!.fullAddress!;
    profileImage.value = myInformation.profileDetails!.hospitalProfilePicture!;
    licensesImage.value = myInformation.profileDetails!.hospitalLicenseImage!;
  }

}