import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget notificationTile({
  required String title,
  required String subtitle,
  bool isUnread = false,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: 8.radius,
      border: Border.all(color: AppColors.textFormFieldBorder)
    ),
    margin: EdgeInsets.only(bottom: 8.h),
    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Left Icon (Baby themed color)
        CircleAvatar(
          radius: 22.h,
          backgroundColor: AppColors.primary.withAlpha(25),
          child: Icon(Icons.vaccines, color: AppColors.primary, size: 20.sp),
        ),
        12.widthSpace,

        /// Title + Subtitle + Time
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              4.heightSpace,
              CustomText(
                text: subtitle,
                fontSize: 13.sp,
                color: AppColors.textSecondary,
              ),
              4.heightSpace,
            ],
          ),
        ),

        /// Unread Indicator
        // if (isUnread)
        //   Padding(
        //     padding: EdgeInsets.only(left: 6.w, top: 6.h),
        //     child: CircleAvatar(
        //       radius: 4.h,
        //       backgroundColor: AppColors.primary,
        //     ),
        //   ),
      ],
    ),
  );
}