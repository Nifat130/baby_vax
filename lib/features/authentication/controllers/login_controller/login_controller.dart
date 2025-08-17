import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/features/authentication/data/repositories/authentication_repo.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onClose() {
    phoneNumberController.clear();
    enterPasswordController.clear();
    emailTEController.clear();
    super.onClose();
  }

  final phoneNumberController = TextEditingController();
  final emailTEController = TextEditingController();
  final enterPasswordController = TextEditingController();
  var selectedWay = "Phone".obs;
  RxBool passwordVisibility = true.obs;
  final object = AuthenticationRepository();


  void checkNumber(){
    if(phoneNumberController.text.isNotEmpty && GetUtils.isPhoneNumber(phoneNumberController.text)){
      if(phoneNumberController.text == "4155551234"){
        Get.toNamed(AppRoute.passwordScreen);
      }
      else{
        Get.toNamed(AppRoute.verifyScreen, arguments: phoneNumberController.text);
      }
    }
    else{
      AppSnackBar.showError("Enter a valid phone number!");
    }
  }

  void checkEmail(){
    if(emailTEController.text.isNotEmpty && GetUtils.isEmail(emailTEController.text)){
      if(emailTEController.text == "link@link.com"){
        Get.toNamed(AppRoute.passwordScreen);
      }
      else{
        Get.toNamed(AppRoute.verifyScreen, arguments: emailTEController.text);
      }
    }
    else{
      AppSnackBar.showError("Enter a valid email!");
    }
  }

  void requestToLogin() async{

    final requestBody = {
      "email" : emailTEController.text,
      "password" : enterPasswordController.text,
      "fcm" : "token",
    };

    await object.login(requestBody);
  }
}
