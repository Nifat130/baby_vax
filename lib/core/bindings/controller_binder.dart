import 'package:baby_vax/features/authentication/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

import '../../features/splash_screen/controllers/splash_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    //Get.put<SplashController>(SplashController(), permanent: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true,);
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true,);

  }
}
