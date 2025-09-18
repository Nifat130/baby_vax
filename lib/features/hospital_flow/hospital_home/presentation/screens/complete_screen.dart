import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagePath.successMark, height: 100.h, width: 100.w),
              SizedBox(height: 24.h),
              CustomText(
                text: 'Congratulations ',
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 3.h),
              CustomText(
                text: 'Your event is being created successfully.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff9BA4B0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              // CustomSubmitButton(
              //   text: 'Go To Home',
              //   onTap: () async {
              //     if (fromScreen == "Facilities") {
              //       await AuthService.saveRole('facility');
              //       Get.toNamed(AppRoute.facilitiesNavBar);
              //     } else {
              //       await AuthService.saveRole('provider');
              //       Get.toNamed(AppRoute.facilitiesNavBar); // Replace with your provider screen
              //     }
              //   },
              // ),

              CustomSubmitButton(
                text: 'Go To Home',
                onTap: () async {
                  Get.offAllNamed(AppRoute.hospitalNavBarScreen);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}