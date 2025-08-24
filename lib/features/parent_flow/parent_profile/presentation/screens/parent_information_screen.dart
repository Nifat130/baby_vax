import 'dart:io';

import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/hospital_flow/hospital_profile/controllers/hospital_information_controller.dart';
import 'package:baby_vax/features/parent_flow/parent_profile/controllers/parent_information_controller.dart';
import 'package:baby_vax/features/parent_flow/parent_profile/controllers/parent_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/common/widgets/show_progress_indicator.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/validators/app_validator.dart';
import '../../../../../routes/app_routes.dart';

class ParentInformationScreen extends GetView<ParentInformationController> {
  ParentInformationScreen({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Obx((){
            if(controller.isLoading.value){
              return ShowProgressIndicator();
            }
            else{
              return SingleChildScrollView(
                child: Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customBackCenterTitleHeading("Parent Information"),
                      48.heightSpace,
                      Center(
                        child: Stack(
                          children: [
                            Obx(() =>
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: CircleAvatar(
                                    backgroundImage: controller.profileImage.value == '' ?
                                    AssetImage(ImagePath.dummyProfilePicture) :
                                    FileImage(File(controller.profileImage.value)),
                                    radius: 50.h,
                                  ),
                                )
                            ),
                            Positioned(
                              bottom: 0.h,
                              right: 0.w,
                              left: 0.w,
                              child: GestureDetector(
                                onTap: (){
                                  controller.profileImagePicker();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                                  child: Icon(Icons.add, color: AppColors.textWhite,),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      16.heightSpace,
                      CustomText(text: "Your Name", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.parentName,
                        hintText: "Enter your name",
                        validator: (value) => AppValidator.validateField(value, "Name"),
                      ),
                      16.heightSpace,
                      CustomText(text: "Your Number", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.parentNumber,
                        hintText: "Enter your number",
                        validator: (value) => AppValidator.validateField(value, "Number"),
                      ),
                      16.heightSpace,
                      CustomText(text: "Your Address", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.parentAddress,
                        hintText: "Enter hospital address",
                        validator: (value) => AppValidator.validateField(value, "Address"),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: CustomSubmitButton(
            text: "Update",
            onTap: (){},
          ),
        ),
      ),
    );
  }
}


