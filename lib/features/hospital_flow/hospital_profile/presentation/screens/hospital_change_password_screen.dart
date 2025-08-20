import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/hospital_flow/hospital_profile/controllers/hospital_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/common/widgets/show_progress_indicator.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/validators/app_validator.dart';

class HospitalChangePasswordScreen extends GetView<HospitalInformationController> {
  HospitalChangePasswordScreen({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Obx((){
            if(controller.isLoading.value){
              return ShowProgressIndicator();
            }
            else{
              return SingleChildScrollView(
                child: Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customBackCenterTitleHeading("Change Password"),
                      24.heightSpace,
                      16.heightSpace,
                      CustomText(text: "Current Password", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                      8.heightSpace,
                      Obx(() =>
                          CustomTextFormField(
                            controller: controller.hospitalCurrentPass,
                            hintText: "Enter your password",
                            obscureText: !controller.confirmPassVisibility.value,
                            validator: AppValidator.validatePassword,
                            suffixIcon: GestureDetector(
                                onTap: (){
                                  controller.currentPassVisibility.value = !controller.currentPassVisibility.value;
                                },
                                child: !controller.currentPassVisibility.value ?
                                Icon(Icons.visibility_outlined) :
                                Icon(Icons.visibility_off_outlined)
                            ),
                          )
                      ),
                      16.heightSpace,
                      CustomText(text: "New Password", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                      8.heightSpace,
                      Obx(() =>
                          CustomTextFormField(
                            controller: controller.hospitalNewPass,
                            hintText: "Enter your new password",
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
                            validator: (value) => AppValidator.matchPassword(value, controller.hospitalNewPass.text),
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
                        text: "Save",
                        onTap: (){},
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}


