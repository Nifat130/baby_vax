import 'package:baby_vax/core/common/widgets/align_text.dart';
import 'package:baby_vax/core/common/widgets/custom_appbar.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/validators/app_validator.dart';
import 'package:baby_vax/features/authentication/controllers/forgotten/forgotten_password_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgottenPassword extends StatelessWidget {
  ForgottenPassword({super.key});

  final controller = Get.put(ForgottenPasswordController());
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
                text: 'Forgot Password',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              SizedBox(height: 16.h),
              CustomText(
                text:
                    'No worries! Enter your email address below and we will send you a code to reset password.',
                textAlign: TextAlign.center,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),

              SizedBox(height: 32.h),

              CustomAlignText(text: "Email"),
              SizedBox(height: 6.h),
              CustomTextFormField(
                controller: controller.emailController,
                hintText: 'Enter your email',
                validator: AppValidator.validateEmail,
              ),

              Spacer(),
              CustomSubmitButton(
                text: 'Send Reset Code',
                onTap: () {
                  controller.sendOtp();
                },
              ),
              SizedBox(height: 52.h),
            ],
          ),
        ),
      ),
    );
  }
}