import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final phoneNumberController = TextEditingController();

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
