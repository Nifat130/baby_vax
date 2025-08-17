import 'dart:async';

import 'package:baby_vax/features/authentication/data/repositories/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  final otpController = TextEditingController();

  final RxInt remainingTime = 60.obs;
  final RxBool enableResendCodeButton = false.obs;
  late Timer _timer;

  final object = AuthenticationRepository();
  void startTimer() {
    enableResendCodeButton.value = false;
    remainingTime.value = 60;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value == 0) {
        timer.cancel();
        enableResendCodeButton.value = true;
      } else {
        remainingTime.value--;
      }
    });
  }

  var sendLocation = "".obs;
  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      sendLocation.value = Get.arguments;
    }
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void requestToSubmitOTP() async{

    final requestBody = {
      "otp": otpController.text.toString(),
      "reason": "SIGNUP_OTP_SECRET"
    };

    //SIGNUP_OTP_SECRET,LOGIN_OTP_SECRET,RESET_PASSWORD_SECRET


    object.signUpVerifyOTP(requestBody);
  }
}
