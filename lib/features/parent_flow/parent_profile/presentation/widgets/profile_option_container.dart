import 'package:baby_vax/core/services/Auth_service.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_outline_button.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../routes/app_routes.dart';

Widget profileOptionContainer(IconData icon, String title, String routeName){

  return GestureDetector(
    onTap: (){
      if(title == "Log Out"){
        showModalBottomSheet(
          context: Get.context!,
          builder: (_) => SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.h))
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: 100.w,
                          child: Divider(
                            thickness: 4,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        CustomText(text: "Logout", fontSize: 18.sp, color: AppColors.textPrimary, fontWeight: FontWeight.w700,),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: 327.w,
                          child: Divider(),
                        ),
                        SizedBox(height: 12.h),
                        CustomText(text: "Are you sure you want to log out?", fontSize: 16.sp, color: AppColors.backgroundDark, fontWeight: FontWeight.w400,),
                        SizedBox(height: 24.h,),
                        SizedBox(
                          width: 350.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: CustomOutlineButton(
                                    onPressed: (){
                                      Get.back();
                                    },
                                    text: "Cancel"
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Flexible(
                                flex: 1,
                                child: CustomSubmitButton(
                                  text: "Yes, Logout",
                                  onTap: (){
                                    AuthService.logoutUser();
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
      else{
        Get.toNamed(routeName);
      }
    },
    child: Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: 4.radius,
          border: Border.all(color: AppColors.textFormFieldBorder)
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 12.w,
              children: [
                Icon(icon, color: title == 'Log Out' ? AppColors.error : AppColors.textSecondary,),
                CustomText(text: title, fontSize: 16.sp, color: title == "Log Out" ? AppColors.error : AppColors.textSecondary,)
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: title == "Log Out" ? AppColors.error : AppColors.textSecondary)
          ],
        ),
      ),
    ),
  );
}