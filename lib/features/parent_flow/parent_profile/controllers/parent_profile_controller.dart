

import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import 'package:get/get.dart';

class ParentProfileController extends GetxController{

  var isLoading = false.obs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getMyInformation();
  }

  final parentController = Get.find<ParentHomeController>();
  var profilePicture = '';
  var name = '';
  var email = '';
  Future<void> getMyInformation() async{
    isLoading.value = true;
    name = parentController.myInformation.profileDetails!.parentName ?? 'Unknown';
    email = parentController.myInformation.email ?? 'Unknown';
    profilePicture = parentController.myInformation.profileDetails!.parentProfilePicture ?? '';
    isLoading.value = false;
  }
}