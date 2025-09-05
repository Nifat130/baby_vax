

import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/repositories/authentication_repository/authentication_repo.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  final authRepo = AuthenticationRepo();
  final emailTEController = TextEditingController();
  final passwordTEController = TextEditingController();
  var visiblePass = false.obs;

  void requestToSignIn() async{

    showProgressIndicator();
    log("I am going to loing");
    final response = await authRepo.signInToAccount(email: emailTEController.text, password: passwordTEController.text);

    if(response.isNotEmpty){
      await AuthService.saveId(response[0]["id"], response[0]["email"]);
      await AuthService.saveRole(response[0]["role"]);
      log("Id: ${AuthService.id}");
      log("role: ${AuthService.userRole}");
      AuthService.userRole == "PARENT" ?
      Get.offAllNamed(AppRoute.parentNavBarScreen) :
      Get.offAllNamed(AppRoute.hospitalNavBarScreen);
    }
    else{
      Get.back();
      AppSnackBar.showSuccess("Failed to sign in!!");
    }

    log("I came from loing");
  }

}