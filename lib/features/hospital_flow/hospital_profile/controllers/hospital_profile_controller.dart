
import 'package:baby_vax/features/hospital_flow/hospital_home/controllers/hospital_home_controller.dart';
import 'package:get/get.dart';

class HospitalProfileController extends GetxController{

  String hospitalName = '';
  String profilePicture = '';
  String hospitalEmail = '';


  var isLoading = false.obs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    await getMyInformation();
    isLoading.value = false;
  }

  final homeController = Get.find<HospitalHomeController>();
  Future<void> getMyInformation() async{
    hospitalName = homeController.myInformation.profileDetails!.hospitalName ?? 'Unknown';
    profilePicture = homeController.myInformation.profileDetails!.hospitalProfilePicture ?? '';
    hospitalEmail = homeController.myInformation.email ?? 'Unknown';
  }

}