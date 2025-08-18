import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

Widget navBarButtonWidget(String imagePath, String text){
  
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4.h,
      children: [
        Image.asset(imagePath, height: 20.h, width: 20.w,),
        CustomText(text: text, fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.textWhite,)
      ],
    ),
  );
}