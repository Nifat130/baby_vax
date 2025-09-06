import 'dart:io';

import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/hospital_flow/hospital_profile/controllers/hospital_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/validators/app_validator.dart';

class HospitalInformationScreen extends GetView<HospitalInformationController> {
  HospitalInformationScreen({super.key});

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBackCenterTitleHeading("Hospital Information"),
              24.heightSpace,
              Obx((){
                if(controller.isLoading.value){
                  return CustomProgressIndicator();
                }
                else{
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                      backgroundImage: controller.profileImage.value.startsWith("https") ?
                                      NetworkImage(controller.profileImage.value) : controller.profileImage.value == '' ?
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
                        CustomText(text: "Hospital Name", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                        8.heightSpace,
                        CustomTextFormField(
                          controller: controller.hospitalName,
                          hintText: "Enter hospital name",
                          validator: (value) => AppValidator.validateField(value, "Name"),
                        ),
                        // 16.heightSpace,
                        // CustomText(text: "Hospital Email", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                        // 8.heightSpace,
                        // CustomTextFormField(
                        //   controller: controller.hospitalEmail,
                        //   hintText: "Enter hospital email",
                        //   readonly: true,
                        //   validator: AppValidator.validateEmail,
                        // ),
                        16.heightSpace,
                        CustomText(text: "Hospital Address", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                        8.heightSpace,
                        CustomTextFormField(
                          controller: controller.hospitalAddress,
                          hintText: "Enter hospital address",
                          validator: (value) => AppValidator.validateField(value, "Address"),
                        ),
                        16.heightSpace,
                        CustomText(text: "Hospital License", fontSize: 12.sp, textAlign: TextAlign.center, color: AppColors.textSecondary,),
                        8.heightSpace,
                        Obx(() =>
                        controller.licensesImage.value != '' ?
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: 8.radius,
                                child: controller.licensesImage.value.startsWith('https') ?
                                Image.network(controller.licensesImage.value, fit: BoxFit.fill, height: 200.h, width: SizeUtils.width,) :
                                Image.file(File(controller.licensesImage.value), fit: BoxFit.fill, height: 200.h, width: SizeUtils.width,)
                            ),
                            Positioned(
                              right: 8.w,
                              top: 8.h,
                              child: GestureDetector(
                                onTap: (){
                                  controller.licensesImage.value = '';
                                },
                                child: Icon(Icons.cancel, color: AppColors.error, size: 40.h,),
                              ),
                            )
                          ],
                        ) :
                        GestureDetector(
                          onTap: (){
                            controller.licenseImagePicker();
                          },
                          child: Container(
                            height: 200.h,
                            width: SizeUtils.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.textFormFieldBorder),
                                borderRadius: 8.radius
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.upload_file_outlined, color: AppColors.textSecondary,),
                                8.heightSpace,
                                CustomText(text: "Upload hospital license image", color: AppColors.textSecondary,)
                              ],
                            ),
                          ),
                        )
                        ),
                        32.heightSpace,
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
          child: CustomSubmitButton(
            text: "Update",
            onTap: (){
              controller.updateHospitalInfo();
            },
          ),
        ),
      ),
    );
  }
}


