import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/parent_flow/parent_event/controllers/parent_event_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_submit_button.dart';


class ParentEventDetailsScreen extends GetView<ParentEventDetailsController> {
  const ParentEventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customBackCenterTitleHeading("Event Details"),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textFormFieldBorder),
                        borderRadius: BorderRadius.circular(8.h)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8.w,
                        children: [
                          Flexible(
                            flex: 2,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(ImagePath.dummyProfilePicture),
                              radius: 50.h,
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 8.h,
                                children: [
                                  CustomText(text: "Ibn Sina Hospital", fontWeight: FontWeight.w600, fontSize: 18.sp, color: AppColors.primary,),
                                  CustomText(text: "123/1, Block D, Dhanmondi, Dhaka", fontSize: 13.sp, color: AppColors.textSecondary,),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    16.heightSpace,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        border: Border.all(color: AppColors.textFormFieldBorder)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Vaccine Name", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          8.heightSpace,
                          CustomText(text: "Rotavirus Vaccine", color: AppColors.textSecondary),
                          16.heightSpace,
                          CustomText(text: "Vaccine Type", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          8.heightSpace,
                          CustomText(text: "Rotavirus", color: AppColors.textSecondary),
                          16.heightSpace,
                          CustomText(text: "Age Limit", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          8.heightSpace,
                          CustomText(text: "8 months", color: AppColors.textSecondary),
                          16.heightSpace,
                          CustomText(text: "Event Date", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          8.heightSpace,
                          CustomText(text: "20 Nov, 2025", color: AppColors.textSecondary),
                          16.heightSpace,
                          CustomText(text: "Start Time", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          8.heightSpace,
                          CustomText(text: "02:30 PM", color: AppColors.textSecondary),
                          16.heightSpace,
                          CustomText(text: "Vaccine Details", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          8.heightSpace,
                          CustomText(text: "The rotavirus vaccine protects against severe diarrhea and dehydration caused by rotavirus. It is given orally in multiple doses to infants.", color: AppColors.textSecondary),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Obx(() =>
            controller.isAssigned.value ?
            CustomSubmitButton(
              text: "Remove",
              color: AppColors.error,
              onTap: () {
                controller.isAssigned.value = !controller.isAssigned.value;
              },
            ) :
            CustomSubmitButton(
              text: "Mark",
              onTap: () {
                controller.isAssigned.value = !controller.isAssigned.value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
