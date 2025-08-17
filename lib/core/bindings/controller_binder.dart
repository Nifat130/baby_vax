import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../features/splash_screen/controllers/splash_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    //Get.put<SplashController>(SplashController(), permanent: true);
    Get.lazyPut<SplashController>(
          () => SplashController(),
      fenix: true,
    );

  }
}
