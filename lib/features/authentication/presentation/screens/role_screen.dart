import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/logo_path.dart';
import 'package:baby_vax/features/authentication/controllers/sign_up_controller.dart';
import 'package:baby_vax/features/authentication/presentation/widgets/role_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

class RoleScreen extends GetView<SignUpController> {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_rounded),
                ),
                16.heightSpace,
                Center(
                  child: Image.asset(LogoPath.logo, fit: BoxFit.fill, height: 200.h, width: 200.w,),
                ),
                CustomText(text: "Welcome to Baby Vax", fontSize: 24.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w600,),
                12.heightSpace,
                CustomText(text: "Your Simple Path to Stress-Free Vaccine Management", fontSize: 14.sp, textAlign: TextAlign.start, color: AppColors.textSecondary,),
                24.heightSpace,
                roleContainer(controller, "Hospital"),
                16.heightSpace,
                roleContainer(controller, "Parent"),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: CustomSubmitButton(
            text: "Continue",
            onTap: (){

            },
          ),
        ),
      ),
    );
  }
}
