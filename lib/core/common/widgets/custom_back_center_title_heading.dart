import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/icon_path.dart';
import 'custom_text.dart';

Widget customBackCenterTitleHeading(String title, {Widget? icon}){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_rounded),
      ),
      CustomText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w600,),
      Icon(Icons.circle, color: AppColors.textWhite,)
    ],
  );
}