import 'package:baby_vax/core/common/widgets/align_text.dart';
import 'package:baby_vax/core/common/widgets/custom_appbar.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/validators/app_validator.dart';
import 'package:baby_vax/features/authentication/controllers/select_role_controller.dart';
import 'package:baby_vax/features/authentication/controllers/sign_up_controller/create_account_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final controller = Get.put(CreateAccountController());
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
                text: 'Create your account',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              SizedBox(height: 4.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an Account? ",
                    color: AppColors.textSecondary,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomText(text: "Log in", color: AppColors.primary),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              CustomAlignText(text: "Full Name"),
              SizedBox(height: 6.h),
              CustomTextFormField(
                controller: controller.fullNameController,
                hintText: 'Enter your full name',
                validator:
                    (value) => AppValidator.validateField(value, "Name "),
              ),
              SizedBox(height: 20.h),

              CustomAlignText(text: "Email"),
              SizedBox(height: 6.h),
              CustomTextFormField(
                controller: controller.emailTEController,
                hintText: 'Enter your email',
                validator: AppValidator.validateEmail,
              ),
              SizedBox(height: 20.h),

              CustomAlignText(text: "Password "),
              SizedBox(height: 6.h),

              Obx(
                () => CustomTextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.passwordVisibility.value,
                  hintText: 'Enter Password',
                  validator: AppValidator.validatePassword,
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

              SizedBox(height: 20.h),
              CustomAlignText(text: "Confirm Password"),
              SizedBox(height: 6.h),
              Obx(
                () => CustomTextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.confirmPasswordVisibility.value,
                  hintText: 'Confirm Password',
                  validator: AppValidator.validatePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.confirmPasswordVisibility.toggle();
                    },
                    child: Icon(
                      controller.confirmPasswordVisibility.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              CustomSubmitButton(
                text: 'Continue',
                onTap: () {
                  controller.requestToCreateAccount();
                },
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
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoute.legalAndPolicies);
                            },
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
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoute.facilityLegalPolicy);
                            },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 37.h),
            ],
          ),
        ),
      ),
    );
  }
}
