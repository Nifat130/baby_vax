import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.secondaryBackGround,
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(height: double.infinity,),
              Padding(
                padding: EdgeInsets.only(top: 40.h, left: 20.w),
                child: Image.asset(ImagePath.onboardingModelThreeImage, fit: BoxFit.fill,),
              ),
              Positioned(
                bottom: 28.h,
                left: 0.w,
                right: 0.w,
                child: Image.asset(ImagePath.onboardingContainer, fit: BoxFit.fill,)
              ),
              Positioned.fill(
                  bottom: -280.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(text: "Tailor Your Experience", maxLines: 2, fontSize: 24.sp, fontWeight: FontWeight.w700, textAlign: TextAlign.center,),
                          SizedBox(height: 20.h,),
                          CustomText(text: "Select the reminder frequency, add doctor visit notes, and manage multiple children’s schedules.", maxLines: 2, fontSize: 16.sp, fontWeight: FontWeight.w400, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                        ],
                      ),
                    ),
                  )
              ),
              Positioned.fill(
                bottom: 28.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(() => SignInScreen());
                    },
                    child: Image.asset(ImagePath.onboardingButtonImage),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 0.h,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(ImagePath.onboardingBottomImage),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
