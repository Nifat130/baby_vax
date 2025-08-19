import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/image_path.dart';

Widget eventContainer(){

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
                child: CustomText(text: "Polio Vaccine For Children", fontWeight: FontWeight.w500, fontSize: 16.sp,),
              ),
              4.widthSpace,
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.delete_outline, color: AppColors.error,),
                ),
              )
            ],
          ),
          8.heightSpace,
          CustomText(text: "Vaccine Type: Polio Vaccine", fontSize: 12.sp, color: AppColors.textSecondary,),
          4.heightSpace,
          CustomText(text: "Maximum Age: 3 Years", fontSize: 12.sp, color: AppColors.textSecondary,),
          4.heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "Date: 25 Aug, 2025", fontSize: 12.sp, color: AppColors.textSecondary,),
              4.heightSpace,
              CustomText(text: "Start Time: 11:00 AM", fontSize: 12.sp, color: AppColors.textSecondary,)
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
                  CustomText(text: "Dhaka Hospital", fontWeight: FontWeight.w500, fontSize: 12.sp,),
                  4.heightSpace,
                  CustomText(text: "Shewrpara, Mirpur, Dhaka", color: AppColors.textSecondary, fontSize: 10.sp,),
                ],
              )
            ],
          )
        ],
      ),
      back: CustomText(
        text: "The **polio vaccine** is a safe and essential immunization that protects children from poliomyelitis, a contagious viral disease that can cause lifelong paralysis or even death. It comes in two forms: the **Oral Polio Vaccine (OPV)**, given as drops, and the **Inactivated Polio Vaccine (IPV)**, given by injection. The vaccine is usually given in multiple doses starting from birth or early infancy and repeated at set intervals, depending on the national immunization schedule. Widely used across the world, the polio vaccine has been the key to nearly eradicating polio, with only very mild side effects such as fever or injection-site soreness in rare cases.",
        maxLines: 4, textOverflow: TextOverflow.fade, fontSize: 10.sp, color: AppColors.textSecondary,),
    ),
  );
}