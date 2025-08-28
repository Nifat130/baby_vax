import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(36.h), bottomLeft: Radius.circular(36.h)),
          color: AppColors.primary
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
      child: SafeArea(bottom: false,child: CustomText(text: title, fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.textWhite,)),
    );
  }
}
