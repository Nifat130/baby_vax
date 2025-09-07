import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/data/hospital_flow/get_events_model.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/controllers/hospital_event_controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/image_path.dart';

Widget eventContainer(HospitalEventController controller, Map<String, dynamic> event){

  final information = GetEventsModel.fromJson(event);
  final eventDate = DateFormat("dd MMM, yyyy").format(information.date!.toLocal());
  final startTime = DateFormat("hh:mm a").format(information.startTime!.toLocal());
  final endTime = DateFormat("hh:mm a").format(information.endTime!.toLocal());
  return Container(
    width: SizeUtils.width,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFormFieldBorder),
        borderRadius: 8.radius
    ),
    margin: EdgeInsets.only(bottom: 12.h),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    child: FlipCard(
      front: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 9,
                child: CustomText(text: information.name!, fontWeight: FontWeight.w500, fontSize: 16.sp,),
              ),
              4.widthSpace,
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    //controller.vaccineEvents.removeAt(event['id'] - 1);
                    //AppSnackBar.showError("Event id ${event['id']} removed");
                    log(information.id!);
                    controller.deleteEvent(eventId: information.id!);

                  },
                  child: Icon(Icons.delete_outline, color: AppColors.error,),
                ),
              )
            ],
          ),
          8.heightSpace,
          CustomText(text: "Vaccine Type: ${information.type}", fontSize: 12.sp, color: AppColors.textSecondary,),
          4.heightSpace,
          CustomText(text: "Maximum Age: ${information.age}", fontSize: 12.sp, color: AppColors.textSecondary,),
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
                backgroundImage: NetworkImage(information.hospitalInfo!.hospitalPicture!),
                radius: 20.h,
              ),
              8.widthSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: information.hospitalInfo!.hospitalName!, fontWeight: FontWeight.w500, fontSize: 12.sp,),
                  4.heightSpace,
                  CustomText(text: information.hospitalInfo!.hospitalAddress!, color: AppColors.textSecondary, fontSize: 10.sp,),
                ],
              )
            ],
          )
        ],
      ),
      back: CustomText(
        text: information.description!,
        maxLines: 4, textOverflow: TextOverflow.fade, fontSize: 10.sp, color: AppColors.textSecondary,),
    ),
  );
}