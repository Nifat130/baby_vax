
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController{
  var selectedRole = ''.obs;

  final parentName = TextEditingController();
  final parentEmail = TextEditingController();
  final parentPass = TextEditingController();
  final parentConfirmPass = TextEditingController();
  final parentAddress = TextEditingController();
  var profileImage = ''.obs;

  void profileImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      profileImage.value = image.path;
    }
  }
  var passVisibility = false.obs;
  var confirmPassVisibility = false.obs;
  final hospitalName = TextEditingController();
  final hospitalEmail = TextEditingController();
  final hospitalPass = TextEditingController();
  final hospitalConfirmPass = TextEditingController();
  final hospitalAddress = TextEditingController();

}