

import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/icon_path.dart';
import 'custom_text.dart';

Widget customBackTitleHeading(String title, {Widget? icon}){

  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: SafeArea(
      bottom: false,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_rounded),
          ),
          SizedBox(width: 12.w,),
          CustomText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w600,),
          Spacer(),
          if (icon != null) icon,
        ],
      ),
    ),
  );
}