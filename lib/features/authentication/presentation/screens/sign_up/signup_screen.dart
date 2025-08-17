import 'package:baby_vax/core/common/widgets/align_text.dart';
import 'package:baby_vax/core/common/widgets/custom_appbar.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/icon_path.dart';
import 'package:baby_vax/features/authentication/controllers/sign_up_controller/signup_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 52.h),
            CustomAppbar(),
            CustomText(
              text: 'Sign up!',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: 'Your Direct Path to Flexible Healthcare Opportunities',
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 48.h),
            CustomAlignText(text: "Phone Number"),
            SizedBox(height: 6.h),

            CustomTextFormField(
              controller: controller.phoneNumberController,
              hintText: '+1',
              prefixIcon: Image.asset(IconPath.phone),
            ),
            SizedBox(height: 32.h),
            CustomSubmitButton(
              text: 'Continue',
              onTap: () {
                Get.toNamed(AppRoute.verifyScreen);
              },
            ),
            SizedBox(height: 32.h),
            CustomText(
              text: 'or',
              textAlign: TextAlign.center,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xffAEADB7),
            ),

            SizedBox(height: 32.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0XFF94A3B8)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined),
                      SizedBox(width: 8.h),
                      CustomText(
                        text: 'Continue with Email',
                        textAlign: TextAlign.center,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Explore our ",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Terms & Conditions ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "\nPrivacy Policy.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 37.h),
          ],
        ),
      ),
    );
  }
}
