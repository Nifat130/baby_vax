import 'package:baby_vax/features/authentication/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

import '../../features/authentication/controllers/sign_up_controller.dart';
import '../../features/hospital_flow/hospital_event/controllers/hospital_event_controller.dart';
import '../../features/hospital_flow/hospital_home/controllers/hospital_home_controller.dart';
import '../../features/hospital_flow/hospital_nav_bar/controllers/hospital_nav_bar_controller.dart';
import '../../features/hospital_flow/hospital_profile/controllers/hospital_information_controller.dart';
import '../../features/parent_flow/parent_home_screen/controllers/add_child_controller.dart';
import '../../features/parent_flow/parent_home_screen/controllers/edit_child_controller.dart';
import '../../features/parent_flow/parent_home_screen/controllers/parent_home_controller.dart';
import '../../features/parent_flow/parent_nav_bar/controllers/parent_nav_bar_controller.dart';
import '../../features/parent_flow/parent_profile/controllers/parent_information_controller.dart';
import '../../features/parent_flow/parent_profile/presentation/screens/parent_profile_screen.dart';
import '../../features/splash_screen/controllers/splash_controller.dart';

class ControllerBinder extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true,);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true,);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true,);
    Get.lazyPut<HospitalNavBarController>(() => HospitalNavBarController(), fenix: true,);
    Get.lazyPut<HospitalHomeController>(() => HospitalHomeController(), fenix: true,);
    Get.lazyPut<HospitalEventController>(() => HospitalEventController(), fenix: true,);
    Get.lazyPut<HospitalInformationController>(() => HospitalInformationController(), fenix: true,);

    Get.lazyPut<ParentHomeController>(() => ParentHomeController(), fenix: true,);
    Get.lazyPut<ParentNavBarController>(() => ParentNavBarController(), fenix: true,);
    Get.lazyPut<ParentInformationController>(() => ParentInformationController(), fenix: true,);
    Get.lazyPut<ParentProfileScreen>(() => ParentProfileScreen(), fenix: true,);
    Get.lazyPut<AddChildController>(() => AddChildController(), fenix: true,);
    Get.lazyPut<EditChildController>(() => EditChildController(), fenix: true,);
  }
}
