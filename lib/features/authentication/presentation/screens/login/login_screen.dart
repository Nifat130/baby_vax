import 'package:baby_vax/core/common/widgets/align_text.dart';
import 'package:baby_vax/core/common/widgets/custom_appbar.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/icon_path.dart';
import 'package:baby_vax/core/utils/validators/app_validator.dart';
import 'package:baby_vax/features/authentication/controllers/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/services/Auth_service.dart';
import '../../../../../routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.find<LoginController>();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formState,
          child: Column(
            children: [
              SizedBox(height: 52.h),
              CustomAppbar(),
              CustomText(
                text: 'Log in',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text:
                    'Your Direct Path Towards Flexible, Hassle-Free Job Placement',
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 48.h),
              CustomAlignText(text: "Email Address"),
              SizedBox(height: 6.h),
              CustomTextFormField(
                controller: controller.emailTEController,
                hintText: 'Enter your email',
                validator: (value) => AppValidator.validateField(value, "Email "),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              SizedBox(height: 20.h),
              CustomAlignText(text: "Enter the password"),
              SizedBox(height: 6.h),
              Obx(
                () => CustomTextFormField(
                  controller: controller.enterPasswordController,
                  obscureText: controller.passwordVisibility.value,
                  validator: (value) => AppValidator.validateField(value, "Password "),
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.passwordVisibility.toggle();
                    },
                    child: Icon(
                      controller.passwordVisibility.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.forgottenPassword);
                  },
                  child: CustomText(
                    text: "Forgot password?",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF193E58),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              CustomSubmitButton(
                text: 'Log in',
                onTap: () {
                  if(formState.currentState!.validate()){
                    controller.requestToLogin();
                  }
                },
              ),
              SizedBox(height: 32.h),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account? ",
                    color: AppColors.textSecondary,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.createAccountScreen);
                    },
                    child: CustomText(
                      text: "Create account",
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 37.h),
            ],
          ),
        ),
      ),
    );
  }
}
