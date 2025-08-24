import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';

Widget parentHomeAppbar(String name, String address, String imagePath){

  return Container(
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.h), bottomRight: Radius.circular(36.h))
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    child: SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imagePath),
                      radius: 24.h,
                    ),
                  ),
                  8.widthSpace,
                  Flexible(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: name, fontSize: 16.sp, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis, color: AppColors.textWhite,),
                        4.heightSpace,
                        CustomText(text: address, color: AppColors.textWhite,fontSize: 10.sp, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.notificationScreen);
                },
                child: Image.asset(IconPath.whiteNotificationIcon, fit: BoxFit.fill, height: 28.h, width: 28.w,),
              ),
            )
          ],
        ),
      ),
    ),
  );
}