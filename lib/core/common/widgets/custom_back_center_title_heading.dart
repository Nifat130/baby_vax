import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

Widget customBackCenterTitleHeading(String title, {Widget? icon}){

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(36.h), bottomLeft: Radius.circular(36.h)),
      color: AppColors.primary
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
    child: SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_rounded, color: AppColors.textWhite,),
          ),
          CustomText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColors.textWhite,),
          Icon(Icons.circle, color: Colors.transparent,)
        ],
      ),
    ),
  );
}