import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/logo_path.dart';
import 'package:baby_vax/features/splash_screen/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});

  final controller = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(LogoPath.logoTwo, fit: BoxFit.fill),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 100.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: CustomProgressIndicator(
              color: AppColors.primary,
              size: 35.h,
            )
          ),
        ),
      ),
    );
  }
}
