import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/image_path.dart';

Widget parentChildrenContainer(String name, String age, String id){

  return Container(
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
                  backgroundImage: AssetImage(ImagePath.dummyProfilePicture),
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
                          child: CustomText(text: name, fontSize: 14.sp,),
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
              Get.toNamed(AppRoute.editChildScreen);
            },
            child: Icon(Icons.edit_note_outlined, color: AppColors.primary,),
          ),
        )
      ],
    ),
  );
}