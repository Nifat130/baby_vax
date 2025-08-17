import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/features/authentication/data/repositories/authentication_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  final emailTEController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final object = AuthenticationRepository();

  @override
  void onClose() {
    emailTEController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void requestToCreateAccount() async{

    final requestBody = {
      "fullName": fullNameController.text,
      "role": AuthService.userRole.toString(),
      "email": emailTEController.text,
      "password": passwordController.text
    };
    await object.signUp(requestBody);
  }

  RxBool passwordVisibility = true.obs;
  RxBool confirmPasswordVisibility = true.obs;
}
