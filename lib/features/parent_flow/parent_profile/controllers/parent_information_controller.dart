
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ParentInformationController extends GetxController{

  var isLoading = false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2), (){});
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
  final hospitalName = TextEditingController(text: "Dhaka Hospital");
  final hospitalEmail = TextEditingController(text: "dhakahospital@gmail.com");
  final hospitalCurrentPass = TextEditingController();
  final hospitalNewPass = TextEditingController();
  final hospitalConfirmPass = TextEditingController();
  final hospitalAddress = TextEditingController(text: "Mirpur, Dhaka, Bangladesh");

}