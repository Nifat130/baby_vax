import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  final Widget? icon;
  final double? fontSize;
  final Color? titleColor;
  final Color? iconColor;
  final bool centerTitle;
  final Widget? trailing; // ✅ New nullable trailing widget

  const CustomAppbar({
    super.key,
    this.title,
    this.icon,
    this.fontSize,
    this.titleColor,
    this.iconColor,
    this.centerTitle = false,
    this.trailing, // ✅ Added to constructor
  });

  @override
  Widget build(BuildContext context) {
    final hasTitle = title != null && title!.trim().isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        height: 52.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Back button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: icon ?? Icon(Icons.arrow_back_rounded),
                color: iconColor,
              ),
            ),

            if (hasTitle)
              Align(
                alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
                child: Padding(
                  padding: centerTitle
                      ? EdgeInsets.zero
                      : EdgeInsets.only(left: 50.w),
                  child: CustomText(
                    text: title!,
                    fontSize: fontSize ?? 18.sp,
                    fontWeight: FontWeight.w600,
                    color: titleColor ?? AppColors.textPrimary,
                  ),
                ),
              ),

            if (trailing != null)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: trailing!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
