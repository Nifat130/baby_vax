

import 'package:baby_vax/core/common/widgets/custom_picker_theme.dart';
import 'package:baby_vax/data/parent_flow/get_my_children_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditChildController extends GetxController{

  final childNameTEController = TextEditingController();
  final dateOfBirthTEController = TextEditingController();
  final fartherNameTEController = TextEditingController();
  final motherNameTEController = TextEditingController();
  final birthPlaceTEController = TextEditingController();
  var selectedGender = 'Male'.obs;
  List<String> genderList = ["Male", "Female"];
  var child = GetMyChildrenModel();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if(Get.arguments != null){
      child = Get.arguments;
      childNameTEController.text = child.name!;
      dateOfBirthTEController.text = DateFormat("dd MMMM, yyyy").format(child.birthDate!.toLocal());
      fartherNameTEController.text = child.fatherName!;
      motherNameTEController.text = child.motherName!;
      birthPlaceTEController.text = child.birthPlace!;
    }
  }
  void pickDOB(BuildContext context) async{
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 18),
      lastDate: DateTime.now(),
      builder: (context, child){
        return customPickerTheme(context, child!);
      }
    );

    if(date != null){
      dateOfBirthTEController.text = DateFormat("dd MMMM, yyyy").format(date);
    }
  }

  var profileImage = "".obs;

  void profileImagePicker() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(image != null){
      profileImage.value = image.path;
    }
  }
}