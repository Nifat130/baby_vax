import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(milliseconds: 1500), () {

      // if(AuthService.hasToken()){
      //   AuthService.userRole == "PROVIDER" ?
      //   Get.offAll(
      //         () => NavBarScreen(),
      //     transition: Transition.fade,
      //     duration: const Duration(milliseconds: 300),
      //     curve: Curves.easeOut,
      //   ) :
      //   Get.offAll(
      //         () => FacilitiesNavBar(),
      //     transition: Transition.fade,
      //     duration: const Duration(milliseconds: 300),
      //     curve: Curves.easeOut,
      //   );
      // }
      //else{
        Get.offNamed(AppRoute.onboardingScreenOne);
      //}
    });
  }
}
