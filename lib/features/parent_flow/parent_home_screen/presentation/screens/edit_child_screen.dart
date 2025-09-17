import 'dart:io';

import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/add_child_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../core/utils/validators/app_validator.dart';
import '../../controllers/edit_child_controller.dart';

class EditChildScreen extends GetView<EditChildController> {
  const EditChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customBackCenterTitleHeading("Edit Child"),
            SafeArea(
              top: false,
              child: Container(
                width: SizeUtils.width,
                decoration: BoxDecoration(
                  borderRadius: 8.radius,
                  border: Border.all(color: AppColors.textFormFieldBorder)
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Obx(() =>
                              Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: CircleAvatar(
                                  backgroundImage: controller.profileImage.value == '' ?
                                  AssetImage(ImagePath.dummyProfilePicture) :
                                  NetworkImage(controller.profileImage.value),
                                  radius: 50.h,
                                ),
                              )
                          ),
                          // Positioned(
                          //   bottom: 0.h,
                          //   right: 0.w,
                          //   left: 0.w,
                          //   child: GestureDetector(
                          //     onTap: (){
                          //       controller.profileImagePicker();
                          //     },
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //           color: AppColors.primary,
                          //           shape: BoxShape.circle
                          //       ),
                          //       padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                          //       child: Icon(Icons.add, color: AppColors.textWhite,),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    24.heightSpace,
                    CustomText(text: "Child Name", fontSize: 12.sp, color: AppColors.textSecondary,),
                    8.heightSpace,
                    CustomTextFormField(
                      controller: controller.childNameTEController,
                      hintText: "Enter vaccine name",
                      validator: (value) => AppValidator.validateField(value, "Name"),
                    ),
                    16.heightSpace,
                    CustomText(text: "Date of Birth", fontSize: 12.sp, color: AppColors.textSecondary,),
                    8.heightSpace,
                    CustomTextFormField(
                      controller: controller.dateOfBirthTEController,
                      hintText: "Select date",
                      readonly: true,
                      suffixIcon: GestureDetector(
                        onTap: (){
                          controller.pickDOB(context);
                        },
                        child: Icon(Icons.calendar_month_outlined),
                      ),
                      validator: (value) => AppValidator.validateField(value, "DOB"),
                    ),
                    16.heightSpace,
                    CustomText(text: "Gender", fontSize: 12.sp, color: AppColors.textSecondary,),
                    8.heightSpace,
                    Obx(() =>
                        CustomDropdownField(
                          items: controller.genderList,
                          hintText: "Select vaccine type",
                          onChanged: (value){
                            controller.selectedGender.value = value;
                          },
                          selectedValue: controller.selectedGender.value,
                        )
                    ),
                    16.heightSpace,
                    CustomText(text: "Birth Place", fontSize: 12.sp, color: AppColors.textSecondary,),
                    8.heightSpace,
                    CustomTextFormField(
                      controller: controller.birthPlaceTEController,
                      hintText: "Enter birth place",
                      validator: (value) => AppValidator.validateField(value, "Birth place"),
                    ),
                    16.heightSpace,
                    CustomText(text: "Father Name", fontSize: 12.sp, color: AppColors.textSecondary,),
                    8.heightSpace,
                    CustomTextFormField(
                      controller: controller.fartherNameTEController,
                      hintText: "Enter father name",
                      validator: (value) => AppValidator.validateField(value, "Father name"),
                    ),
                    16.heightSpace,CustomText(text: "Mother Name", fontSize: 12.sp, color: AppColors.textSecondary,),
                    8.heightSpace,
                    CustomTextFormField(
                      controller: controller.motherNameTEController,
                      hintText: "Enter mother name",
                      validator: (value) => AppValidator.validateField(value, "Mother name"),
                    ),
                    16.heightSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: CustomSubmitButton(
                  text: "Remove",
                  color: AppColors.error,
                  onTap: (){
                    controller.removeChild(controller.child.id.toString());
                  },
                ),
              ),
              8.widthSpace,
              Flexible(
                flex: 1,
                child: CustomSubmitButton(
                  text: "Update",
                  onTap: (){
                    controller.updateChild();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
