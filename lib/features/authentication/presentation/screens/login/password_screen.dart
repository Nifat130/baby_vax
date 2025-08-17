import 'package:baby_vax/core/common/widgets/align_text.dart';
import 'package:baby_vax/core/common/widgets/custom_appbar.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/authentication/controllers/login_controller/login_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});

  final controller = Get.find<LoginController>();

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

            SizedBox(height: 16.h),
            CustomAlignText(text: "Enter the password"),
            SizedBox(height: 6.h),

            Obx(
              () => CustomTextFormField(
                controller: controller.enterPasswordController,
                obscureText: controller.passwordVisibility.value,
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

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoute.forgottenPassword);
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  text: 'Forgot password?',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff193E58),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            CustomSubmitButton(
              text: 'Continue',
              onTap: () {
                  AuthService.userRole == 'facility' ?
                  Get.toNamed(AppRoute.facilitiesNavBar) :
                  Get.toNamed(AppRoute.navBarScreen);
              },
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
