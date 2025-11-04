import 'dart:io';

import 'package:baby_vax/core/common/app_snackber.dart';
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

class HospitalSignUpScreen extends GetView<SignUpController> {
  HospitalSignUpScreen({super.key});

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
                  CustomText(text: "Hospital Name", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  CustomTextFormField(
                    controller: controller.hospitalName,
                    hintText: "Enter hospital name",
                    validator: (value) => AppValidator.validateField(value, "Name"),
                  ),
                  16.heightSpace,
                  CustomText(text: "Hospital Email", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  CustomTextFormField(
                    controller: controller.hospitalEmail,
                    hintText: "Enter hospital email",
                    validator: AppValidator.validateEmail,
                  ),
                  16.heightSpace,
                  CustomText(text: "Hospital Address", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  CustomTextFormField(
                    controller: controller.hospitalAddress,
                    hintText: "Enter hospital address",
                    validator: (value) => AppValidator.validateField(value, "Address"),
                  ),
                  16.heightSpace,
                  CustomText(text: "Hospital License", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  Obx(() =>
                    controller.licensesImage.value != '' ?
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: 8.radius,
                                child: Image.file(File(controller.licensesImage.value), fit: BoxFit.fill, height: 200.h, width: SizeUtils.width,)
                            ),
                            Positioned(
                              right: 8.w,
                              top: 8.h,
                              child: GestureDetector(
                                onTap: (){
                                  controller.licensesImage.value = '';
                                },
                                child: Icon(Icons.cancel, color: AppColors.error, size: 40.h,),
                              ),
                            )
                          ],
                        ) :
                        GestureDetector(
                          onTap: (){
                            controller.licenseImagePicker();
                          },
                          child: Container(
                            height: 200.h,
                            width: SizeUtils.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.textFormFieldBorder),
                              borderRadius: 8.radius
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_file_outlined, color: AppColors.textSecondary,),
                                8.heightSpace,
                                CustomText(text: "Upload hospital license image", color: AppColors.textSecondary,)
                              ],
                            ),
                          ),
                        )
                  ),
                  16.heightSpace,
                  CustomText(text: "Password", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                  8.heightSpace,
                  Obx(() =>
                      CustomTextFormField(
                        controller: controller.hospitalPass,
                        hintText: "Enter your password",
                        obscureText: !controller.passVisibility.value,
                        validator: AppValidator.validatePassword,
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
                        controller: controller.hospitalConfirmPass,
                        hintText: "Confirm your password",
                        obscureText: !controller.confirmPassVisibility.value,
                        validator: (value) => AppValidator.matchPassword(value, controller.hospitalPass.text),
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
                    onTap: (){
                      if(formState.currentState!.validate()){
                        controller.profileImage.value != '' ?
                        controller.licensesImage.value != '' ?
                        controller.createHospitalAccount() :
                            AppSnackBar.showError("Upload license picture"):
                            AppSnackBar.showError("Upload profile picture");
                      }
                    },
                  ),
                  16.heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(text: "Already have an account? ", color: AppColors.textSecondary,),
                      GestureDetector(
                        onTap: (){
                          Get.until((route) => route.isFirst);
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
