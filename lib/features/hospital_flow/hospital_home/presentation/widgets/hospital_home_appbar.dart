import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';

Widget hospitalHomeAppbar(String name, String address, String imagePath, bool isLoading){

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
        child: !isLoading ?
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: CircleAvatar(
                backgroundImage: imagePath == ImagePath.dummyProfilePicture ? AssetImage(imagePath) : NetworkImage(imagePath),
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
                  CustomText(text: address, color: AppColors.textWhite,fontSize: 12.sp, fontWeight: FontWeight.w500, textOverflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          ],
        ) : CustomProgressIndicator(color: AppColors.textWhite, size: 25.h,)
      ),
    ),
  );
}

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Flexible(
// flex: 9,
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Flexible(
// flex: 3,
// child: CircleAvatar(
// backgroundImage: imagePath == ImagePath.dummyProfilePicture ? AssetImage(imagePath) : NetworkImage(imagePath),
// radius: 24.h,
// ),
// ),
// 8.widthSpace,
// Flexible(
// flex: 7,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CustomText(text: name, fontSize: 16.sp, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis, color: AppColors.textWhite,),
// 4.heightSpace,
// CustomText(text: address, color: AppColors.textWhite,fontSize: 10.sp, fontWeight: FontWeight.w600, textOverflow: TextOverflow.ellipsis,),
// ],
// ),
// ),
// ],
// ),
// ),
// Flexible(
// flex: 1,
// child: GestureDetector(
// onTap: (){
// Get.toNamed(AppRoute.notificationScreen);
// },
// child: Image.asset(IconPath.notificationTwo, fit: BoxFit.fill),
// ),
// )
// ],
// )