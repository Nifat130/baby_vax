import 'package:baby_vax/features/authentication/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

import '../../features/authentication/controllers/sign_up_controller.dart';

class ControllerBinder extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController(), fenix: true,);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true,);
  }
}
