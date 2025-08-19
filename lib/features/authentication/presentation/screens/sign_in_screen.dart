import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/validators/app_validator.dart';
import 'package:baby_vax/features/authentication/controllers/sign_in_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<SignInController> {
  SignInScreen({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    46.heightSpace,
                    Center(
                      child: CustomText(text: "Sign In", fontSize: 28.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w600,),
                    ),
                    12.heightSpace,
                    CustomText(text: "Your Simple Path to Stress-Free Vaccine Management", fontSize: 14.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                    36.heightSpace,
                    CustomText(text: "Email", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                    8.heightSpace,
                    CustomTextFormField(
                      controller: controller.emailTEController,
                      hintText: "Enter your email",
                      validator: (value) => AppValidator.validateField(value, "Email"),
                    ),
                    16.heightSpace,
                    CustomText(text: "Password", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                    8.heightSpace,
                    Obx(() =>
                        CustomTextFormField(
                          controller: controller.passwordTEController,
                          hintText: "Enter your password",
                          obscureText: !controller.visiblePass.value,
                          validator: (value) => AppValidator.validateField(value, "Password"),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              controller.visiblePass.value = !controller.visiblePass.value;
                            },
                            child: !controller.visiblePass.value ?
                            Icon(Icons.visibility_outlined) :
                            Icon(Icons.visibility_off_outlined)
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: SizedBox(
          height: 150.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSubmitButton(
                  text: "Sign In",
                  onTap: (){
                    if(formState.currentState!.validate()){
                      if(controller.emailTEController.text == "hospital@fexpost.com"){
                        Get.toNamed(AppRoute.hospitalNavBarScreen);
                      }
                    }
                  },
                ),
                16.heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(text: "Don't have an account? ", color: AppColors.textSecondary,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoute.roleScreen);
                      },
                      child: CustomText(text: "Sign Up", color: AppColors.primary,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
