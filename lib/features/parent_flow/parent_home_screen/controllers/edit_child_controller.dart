

import 'package:baby_vax/core/common/widgets/custom_picker_theme.dart';
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
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    childNameTEController.text = "Kuddus Mia";
    dateOfBirthTEController.text = "28 August, 2025";
    fartherNameTEController.text = 'Abdullah Talukdar';
    motherNameTEController.text = "Unknown Begum";
    birthPlaceTEController.text = "Rajshahi";
  }
  void pickDOB(BuildContext context) async{
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 18),
      lastDate: DateTime.now(),
      builder: (context, child){
        return Theme(data: customPickerTheme(context), child: child!);
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