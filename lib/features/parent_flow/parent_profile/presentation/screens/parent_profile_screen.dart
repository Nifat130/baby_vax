import 'package:baby_vax/core/common/widgets/custom_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/parent_flow/parent_profile/controllers/parent_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../routes/app_routes.dart';
import '../widgets/profile_option_container.dart';

class ParentProfileScreen extends GetView<ParentProfileController> {
  const ParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeading(title: "Profile"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.heightSpace,
                  Obx(()=>
                    controller.isLoading.value ?
                        CustomProgressIndicator() :
                    SizedBox(
                      width: SizeUtils.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(controller.profilePicture),
                            radius: 45.h,
                          ),
                          SizedBox(height: 16.h,),
                          CustomText(text: controller.name, fontSize: 16.sp, fontWeight: FontWeight.w500,),
                          SizedBox(height: 4.h,),
                          CustomText(text: controller.email, color: AppColors.textSecondary,)
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: 32.h,),
                  CustomText(text: "Edit Information",),
                  SizedBox(height: 16.h,),
                  profileOptionContainer(Icons.person_outlined, "Personal Information", AppRoute.parentInformationScreen),
                  profileOptionContainer(Icons.lock_outline, "Change Password", AppRoute.parentChangePasswordScreen),
                  SizedBox(height: 20.h,),
                  CustomText(text: "Terms & Support",),
                  SizedBox(height: 16.h,),
                  profileOptionContainer(Icons.policy_outlined, "Legal and Policies", AppRoute.legalAndPoliciesScreen),
                  profileOptionContainer(Icons.logout_rounded, "Log Out", AppRoute.signInScreen),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}