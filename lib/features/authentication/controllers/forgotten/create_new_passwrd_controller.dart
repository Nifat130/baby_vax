import 'package:baby_vax/features/authentication/data/repositories/authentication_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateNewPasswrdController extends GetxController {
  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final object = AuthenticationRepository();
  RxBool newPasswordVisibility = true.obs;
  RxBool confirmPasswordVisibility = true.obs;


  void requestToResetPassword() async{

    final requestBody = {
      "newPassword": newPasswordController.text,
      "reason": "RESET_PASSWORD_SECRET"
    };

    await object.resetPassword(requestBody);
  }


}
