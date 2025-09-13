import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/show_progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/parent_flow/parent_event/controllers/parent_event_details_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
            child: Obx((){
              if(controller.isLoading.value){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                  child: ShowProgressIndicator(),
                );
              }
              else if(controller.event == null){
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                    child: CustomText(text: "No data found"),
                  ),
                );
              }
              else{
                final eventDate = DateFormat("dd MMM, yyyy").format(controller.event.date!.toLocal());
                final eventStart = DateFormat("hh:mm a").format(controller.event.startTime!.toLocal());
                return Padding(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8.w,
                            children: [
                              Flexible(
                                flex: 2,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(controller.event.hospitalInfo!.hospitalPicture!),
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
                                      CustomText(text: controller.event.hospitalInfo!.hospitalName!, fontWeight: FontWeight.w600, fontSize: 18.sp, color: AppColors.primary,),
                                      CustomText(text: controller.event.hospitalInfo!.hospitalAddress!, fontSize: 13.sp, color: AppColors.textSecondary,),
                                      GestureDetector(
                                        onTap: (){
                                          Get.toNamed(AppRoute.googleMapScreen, arguments: controller.event);
                                        },
                                        child: Row(
                                          spacing: 4.w,
                                          children: [
                                            Icon(Icons.location_history, color: AppColors.warning,),
                                            CustomText(text: "See on the map", color: AppColors.warning,),
                                          ],
                                        ),
                                      ),
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
                              CustomText(text: controller.event.name!, color: AppColors.textSecondary),
                              16.heightSpace,
                              CustomText(text: "Vaccine Type", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                              8.heightSpace,
                              CustomText(text: controller.event.type!, color: AppColors.textSecondary),
                              16.heightSpace,
                              CustomText(text: "Age Limit", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                              8.heightSpace,
                              CustomText(text: controller.event.age!, color: AppColors.textSecondary),
                              16.heightSpace,
                              CustomText(text: "Event Date", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                              8.heightSpace,
                              CustomText(text: eventDate, color: AppColors.textSecondary),
                              16.heightSpace,
                              CustomText(text: "Start Time", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                              8.heightSpace,
                              CustomText(text: eventStart, color: AppColors.textSecondary),
                              16.heightSpace,
                              CustomText(text: "Vaccine Details", fontWeight: FontWeight.w600, fontSize: 16.sp,),
                              8.heightSpace,
                              CustomText(text: controller.event.description!, color: AppColors.textSecondary),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Obx(() =>
            CustomSubmitButton(
              text: controller.isAssigned.value ? "Remove" : "Mark",
              color: controller.isAssigned.value ? AppColors.error : null,
              onTap: () {
                controller.updateParentSchedule();
              },
            ),
          ),
        ),
      ),
    );
  }
}
