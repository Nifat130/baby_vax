import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/data/parent_flow/get_my_children_model.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';

Widget parentChildrenContainer(GetMyChildrenModel child){

  final difference = DateTime.now().difference(child.birthDate!.toLocal());
  var age = '';

  final years = (difference.inDays / 365).floor();
  final months = ((difference.inDays % 365) / 30).floor();
  final days = (difference.inDays % 30);

  if (years > 0) {
    age = "$years Years";
  } else if (months > 0) {
    age = "$months Months";
  } else {
    age = "$days Days";
  }
  return GestureDetector(
    onTap: (){
      Get.toNamed(AppRoute.childDetailsScreen, arguments: child);
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: 8.radius,
          border: Border.all(color: AppColors.textFormFieldBorder)
      ),
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 9,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(child.profilePicture!),
                  ),
                ),
                16.widthSpace,
                Flexible(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CustomText(text: "Name: ", fontSize: 14.sp, color: AppColors.primary,),
                          ),
                          Flexible(
                            flex: 2,
                            child: CustomText(text: child.name!, fontSize: 14.sp,),
                          ),
                        ],
                      ),
                      8.heightSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CustomText(text: "Age: ", fontSize: 14.sp, color: AppColors.primary,),
                          ),
                          Flexible(
                            flex: 2,
                            child: CustomText(text: age, fontSize: 14.sp,),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Get.toNamed(AppRoute.editChildScreen, arguments: child);
              },
              child: Icon(Icons.edit_note_outlined, color: AppColors.primary, size: 35.h,),
            ),
          )
        ],
      ),
    ),
  );
}