import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/data/hospital_flow/get_events_model.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/controllers/hospital_event_controller.dart';
import 'package:baby_vax/features/parent_flow/parent_event/controllers/parent_event_controller.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/image_path.dart';

Widget parentEventContainer(dynamic controller, GetEventsModel event){

  final eventDate = DateFormat("dd MMM, yyyy").format(event.date!.toLocal());
  final startTime = DateFormat("hh:mm a").format(event.startTime!.toLocal());
  return GestureDetector(
    onTap: (){
      Get.toNamed(AppRoute.parentEventDetailsScreen, arguments: event);
    },
    child: Container(
      width: SizeUtils.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textFormFieldBorder),
          borderRadius: 8.radius
      ),
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: event.name!, fontWeight: FontWeight.w500, fontSize: 16.sp,),
          8.heightSpace,
          CustomText(text: "Vaccine Type: ${event.type}", fontSize: 12.sp, color: AppColors.textSecondary,),
          4.heightSpace,
          CustomText(text: "Age Limit: ${event.age}", fontSize: 12.sp, color: AppColors.textSecondary,),
          4.heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Date:  $eventDate", fontSize: 12.sp, color: AppColors.textSecondary,),
              4.heightSpace,
              CustomText(text: "Start Time:  $startTime", fontSize: 12.sp, color: AppColors.textSecondary,)
            ],
          ),
          16.heightSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImagePath.dummyProfilePicture),
                radius: 20.h,
              ),
              8.widthSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: event.hospitalInfo!.hospitalName!, fontWeight: FontWeight.w500, fontSize: 12.sp,),
                  4.heightSpace,
                  CustomText(text: event.hospitalInfo!.hospitalAddress!, color: AppColors.textSecondary, fontSize: 10.sp,),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}