import 'dart:async';
import 'dart:developer';

import 'package:baby_vax/features/authentication/data/repositories/authentication_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgottenVerifyController extends GetxController {
  final otpController = TextEditingController();

  final RxInt remainingTime = 60.obs;
  final RxBool enableResendCodeButton = false.obs;
  late Timer _timer;

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

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
  final object = AuthenticationRepository();

  void requestToVerifyOTP() async{

    final requestBody = {
      "otp": otpController.text,
      "reason": "FORGET_PASSWORD_SECRET"
    };

    log("===================================================================================");
    log("I am here in controller!");
    await object.verifyOTP(requestBody);

  }
}
