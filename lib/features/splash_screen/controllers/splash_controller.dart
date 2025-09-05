import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  void navigateToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 2500), () {

      AuthService.hasId() ?
          AuthService.userRole == "PARENT" ?
          Get.offAllNamed(AppRoute.parentNavBarScreen) :
          Get.offAllNamed(AppRoute.hospitalNavBarScreen) :
      Get.offAllNamed(AppRoute.onboardingScreenOne);
    });
  }

  @override
  void onInit() {
    super.onInit();
    navigateToHomeScreen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
