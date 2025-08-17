import 'package:baby_vax/features/authentication/data/repositories/authentication_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgottenPasswordController extends GetxController {
  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
  final object = AuthenticationRepository();

  final emailController = TextEditingController();

  void sendOtp() async{

    final requestBody = {
      "email": emailController.text,
      "reason": "FORGET_PASSWORD_SECRET"
    };

    object.resendOTP(requestBody);
  }
}
