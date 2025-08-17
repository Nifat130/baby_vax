import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/core/common/widgets/align_text.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/icon_path.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/authentication/controllers/select_role_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/Auth_service.dart';

class SelectRole extends StatelessWidget {
  SelectRole({super.key});

  final controller = Get.put(SelectRoleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 52.h),
            // CustomAppbar(),
            SizedBox(height: 22.h),
            Image.asset(ImagePath.logo, width: double.infinity, height: 90.h),
            SizedBox(height: 32.h),
            CustomAlignText(
              text: 'Welcome to AnestheLink',
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            SizedBox(height: 4.h),
            CustomAlignText(
              text: 'Choose Your Role to Begin.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 32.h),

            Column(
              children: List.generate(2, (index) {
                return Obx(() {
                  final isSelected = controller.selectedRadio.value == index;
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : AppColors.textWhite,
                      border: Border.all(
                        color:
                            isSelected
                                ? Colors.transparent
                                : AppColors.buttonBorder,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          index == 0
                              ? IconPath.personCircle
                              : IconPath.facility,
                          height: 34.h,
                          width: 41.w,
                          color:
                              isSelected
                                  ? AppColors.textWhite
                                  : AppColors.textSecondary,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomText(
                            text: index == 0 ? "Providers" : "Facility",
                            fontSize: 18.sp,
                            color:
                                isSelected
                                    ? AppColors.textWhite
                                    : AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Radio<int>(
                          value: index,
                          groupValue: controller.selectedRadio.value,
                          onChanged: (value) {
                            controller.selectedRadio.value = value!;
                          },
                          activeColor: AppColors.textWhite,
                        ),
                      ],
                    ),
                  );
                });
              }),
            ),

            Spacer(),
            CustomSubmitButton(
              text: 'Continue',
              onTap: () async {
                if (controller.selectedRadio.value == 0) {
                  // Save the selected role as 'provider'
                  await AuthService.saveRole('PROVIDER');
                  log(AuthService.userRole.toString());
                  Get.toNamed(AppRoute.loginScreen);
                } else if (controller.selectedRadio.value == 1) {
                  // Save the selected role as 'facility'
                  await AuthService.saveRole('FACILITY');
                  log(AuthService.userRole.toString());
                  Get.toNamed(AppRoute.loginScreen);
                } else {
                  AppSnackBar.showError('Please select a role');
                }
              },
            ),


            SizedBox(height: 76.h),
          ],
        ),
      ),
    );
  }
}
