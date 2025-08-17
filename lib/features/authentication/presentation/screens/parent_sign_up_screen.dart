import 'dart:io';

import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/authentication/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/validators/app_validator.dart';
import '../../../../routes/app_routes.dart';

class ParentSignUpScreen extends GetView<SignUpController> {
  ParentSignUpScreen({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                  24.heightSpace,
                  Center(
                    child: CustomText(text: "Create your account", fontSize: 24.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w600,),
                  ),
                  24.heightSpace,
                  Center(
                    child: Stack(
                      children: [
                        Obx(() =>
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: CircleAvatar(
                              backgroundImage: controller.profileImage.value == '' ?
                              AssetImage(ImagePath.dummyProfilePicture) :
                              FileImage(File(controller.profileImage.value)),
                              radius: 50.h,
                            ),
                          )
                        ),
                        Positioned(
                          bottom: 0.h,
                          right: 0.w,
                          left: 0.w,
                          child: GestureDetector(
                            onTap: (){
                              controller.profileImagePicker();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                              child: Icon(Icons.add, color: AppColors.textWhite,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  16.heightSpace,
                  CustomText(text: "Your Name", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  CustomTextFormField(
                    controller: controller.parentName,
                    hintText: "Enter your name",
                    validator: (value) => AppValidator.validateField(value, "Name"),
                  ),
                  16.heightSpace,
                  CustomText(text: "Your Email", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  CustomTextFormField(
                    controller: controller.parentEmail,
                    hintText: "Enter your email",
                    validator: AppValidator.validateEmail,
                  ),
                  16.heightSpace,
                  CustomText(text: "Your Address", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  CustomTextFormField(
                    controller: controller.parentAddress,
                    hintText: "Enter your name",
                    validator: (value) => AppValidator.validateField(value, "Address"),
                  ),
                  16.heightSpace,
                  CustomText(text: "Password", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  Obx(() =>
                      CustomTextFormField(
                        controller: controller.parentPass,
                        hintText: "Enter your password",
                        obscureText: !controller.passVisibility.value,
                        validator: (value) => AppValidator.validateField(value, "Email"),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              controller.passVisibility.value = !controller.passVisibility.value;
                            },
                            child: !controller.passVisibility.value ?
                            Icon(Icons.visibility_outlined) :
                            Icon(Icons.visibility_off_outlined)
                        ),
                      )
                  ),
                  16.heightSpace,
                  CustomText(text: "Confirm Password", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  Obx(() =>
                      CustomTextFormField(
                        controller: controller.parentConfirmPass,
                        hintText: "Confirm your password",
                        obscureText: !controller.confirmPassVisibility.value,
                        validator: (value) => AppValidator.matchPassword(value, controller.parentPass.text),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              controller.confirmPassVisibility.value = !controller.confirmPassVisibility.value;
                            },
                            child: !controller.confirmPassVisibility.value ?
                            Icon(Icons.visibility_outlined) :
                            Icon(Icons.visibility_off_outlined)
                        ),
                      )
                  ),
                  32.heightSpace,
                  CustomSubmitButton(
                    text: "Create Account",
                    onTap: (){},
                  ),
                  16.heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(text: "Already have an account? ", color: AppColors.textSecondary,),
                      GestureDetector(
                        onTap: (){
                          Get.offAllNamed(AppRoute.signInScreen);
                        },
                        child: CustomText(text: "Sign In", color: AppColors.primary,),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
