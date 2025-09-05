import 'package:baby_vax/core/common/widgets/custom_heading.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../routes/app_routes.dart';
import '../widgets/profile_option_container.dart';

class HospitalProfileScreen extends StatelessWidget {
  const HospitalProfileScreen({super.key});

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
                  SizedBox(
                    width: SizeUtils.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(ImagePath.dummyProfilePicture),
                          radius: 45.h,
                        ),
                        SizedBox(height: 16.h,),
                        CustomText(text: "Dhaka Hospital", fontSize: 16.sp, fontWeight: FontWeight.w500,),
                        SizedBox(height: 4.h,),
                        CustomText(text: "dhakahospital@gmail.com", color: AppColors.textSecondary,)
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h,),
                  CustomText(text: "Edit Information",),
                  SizedBox(height: 16.h,),
                  hospitalProfileOptionContainer(Icons.home_outlined, "Hospital Information", AppRoute.hospitalInformationScreen),
                  hospitalProfileOptionContainer(Icons.lock_outline, "Change Password", AppRoute.hospitalChangePasswordScreen),
                  SizedBox(height: 20.h,),
                  CustomText(text: "Terms & Support",),
                  SizedBox(height: 16.h,),
                  hospitalProfileOptionContainer(Icons.policy_outlined, "Legal and Policies", AppRoute.legalAndPoliciesScreen),
                  hospitalProfileOptionContainer(Icons.logout_rounded, "Log Out", AppRoute.signInScreen),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}