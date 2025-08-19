import 'package:baby_vax/core/common/app_snackber.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/controllers/hospital_event_controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/image_path.dart';

Widget eventContainer(HospitalEventController controller, Map<String, dynamic> event){

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
                child: CustomText(text: event['title'], fontWeight: FontWeight.w500, fontSize: 16.sp,),
              ),
              4.widthSpace,
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    controller.vaccineEvents.removeAt(event['id'] - 1);
                    AppSnackBar.showError("Event id ${event['id']} removed");
                  },
                  child: Icon(Icons.delete_outline, color: AppColors.error,),
                ),
              )
            ],
          ),
          8.heightSpace,
          CustomText(text: "Vaccine Type: ${event['vaccineType']}", fontSize: 12.sp, color: AppColors.textSecondary,),
          4.heightSpace,
          CustomText(text: "Maximum Age: ${event['maxAge']}", fontSize: 12.sp, color: AppColors.textSecondary,),
          4.heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Date:  ${event['date']}", fontSize: 12.sp, color: AppColors.textSecondary,),
              4.heightSpace,
              CustomText(text: "Start Time:  ${event['startTime']}", fontSize: 12.sp, color: AppColors.textSecondary,)
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
                  CustomText(text: event['hospitalName'], fontWeight: FontWeight.w500, fontSize: 12.sp,),
                  4.heightSpace,
                  CustomText(text: event['hospitalAddress'], color: AppColors.textSecondary, fontSize: 10.sp,),
                ],
              )
            ],
          )
        ],
      ),
      back: CustomText(
        text: event['details'],
        maxLines: 4, textOverflow: TextOverflow.fade, fontSize: 10.sp, color: AppColors.textSecondary,),
    ),
  );
}