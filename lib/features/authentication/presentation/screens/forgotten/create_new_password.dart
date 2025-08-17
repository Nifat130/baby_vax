import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/align_text.dart';
import 'package:baby_vax/core/common/widgets/custom_appbar.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/validators/app_validator.dart';
import 'package:baby_vax/features/authentication/controllers/forgotten/create_new_passwrd_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});

  final controller = Get.put(CreateNewPasswrdController());
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Column(
              children: [
                SizedBox(height: 52.h),
                CustomAppbar(),
                SizedBox(height: 28.h),
                CustomText(
                  text: 'Create New Password',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                SizedBox(height: 16.h),
          
                CustomText(
                  text: 'Please enter and confirm your new password.',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4A5764),
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: 'You will need to login after you reset.',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff4A5764),
                ),
                SizedBox(height: 32.h),
          
                CustomAlignText(text: "New Password"),
                SizedBox(height: 6.h),
          
                Obx(
                  () => CustomTextFormField(
                    controller: controller.newPasswordController,
                    obscureText: controller.newPasswordVisibility.value,
                    hintText: 'Enter your password',
                    validator: AppValidator.validatePassword,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.newPasswordVisibility.toggle();
                      },
                      child: Icon(
                        controller.newPasswordVisibility.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
          
                CustomAlignText(text: "Confirm Password"),
                SizedBox(height: 6.h),
                Obx(
                  () => CustomTextFormField(
                    controller: controller.confirmPasswordController,
                    obscureText: controller.confirmPasswordVisibility.value,
                    hintText: 'Enter your password',
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

                SizedBox(height: 52.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomSubmitButton(
            text: 'Reset Password',
            onTap: () {
              if(formState.currentState!.validate()){
                if(controller.newPasswordController.text == controller.confirmPasswordController.text){
                  controller.requestToResetPassword();
                }
                else{
                  AppSnackBar.showError("Passwords don't matches!!");
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
