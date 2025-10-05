import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/child_details_controller.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/new_child_details_controller.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/presentation/widgets/new_child_details_calender_widget.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/presentation/widgets/new_child_details_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewChildDetailsScreen extends GetView<NewChildDetailsController> {
  const NewChildDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBackCenterTitleHeading("Child Details"),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: 8.radius,
                        border: Border.all(color: AppColors.textFormFieldBorder)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 55.h,
                              backgroundColor: AppColors.primary,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                                child: ClipOval(
                                  child: controller.child.profilePicture == null || controller.child.profilePicture == '' ?
                                  Image.asset(ImagePath.dummyProfilePicture, fit: BoxFit.contain, height: double.infinity, width: double.infinity,) :
                                  Image.network(controller.child.profilePicture!, fit: BoxFit.contain, height: double.infinity, width: double.infinity,),
                                ),
                              ),
                            ),
                          ),
                          16.heightSpace,
                          CustomText(text: controller.child.name ?? "Unknown Child", color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          16.heightSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "DOB: ${DateFormat("dd MMM, yyyy").format(controller.child.birthDate!.toLocal())}", color: AppColors.textSecondary, fontSize: 14.sp,),
                              CustomText(text: "Gender: ${controller.child.gender}", color: AppColors.textSecondary, fontSize: 14.sp,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    24.heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Vaccine Information", fontSize: 18.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w600,),
                        GestureDetector(
                          onTap: (){
                            controller.showCalender.value = !controller.showCalender.value;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                            child: Obx(() =>
                              controller.showCalender.value ?
                              Icon(Icons.list, color: AppColors.textWhite, size: 20.h,) :
                              Icon(Icons.calendar_month_outlined, color: AppColors.textWhite, size: 20.h,)
                            )
                          ),
                        )
                      ],
                    ),
                    18.heightSpace,
                    Obx(() =>
                      controller.showCalender.value ?
                          NewChildDetailsCalenderWidget() :
                          NewChildDetailsListWidget()
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: CustomSubmitButton(
            text: "Save",
            color: AppColors.primary,
            onTap: (){
              controller.updateChild();
            },
          ),
        ),
      ),
    );
  }
}
