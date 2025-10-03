import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/child_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChildDetailsScreen extends GetView<ChildDetailsScreenController> {
  const ChildDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBackCenterTitleHeading("Child Details"),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: 8.radius,
                        border: Border.all(color: AppColors.textFormFieldBorder)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(ImagePath.dummyProfilePicture),
                              radius: 55.h,
                            ),
                          ),
                          16.heightSpace,
                          CustomText(text: controller.child.name ?? "Unknown Child", color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 16.sp,),
                          16.heightSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "DOB: ${DateFormat("dd MMM, yyyy").format(controller.child.birthDate!.toLocal())}", color: AppColors.textSecondary, fontSize: 14.sp,),
                              CustomText(text: "Gender: ${controller.child.gender}", color: AppColors.textSecondary, fontSize: 14.sp,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    24.heightSpace,
                    Center(
                      child: CustomText(text: "Vaccine Information", fontSize: 18.sp, textAlign: TextAlign.center, fontWeight: FontWeight.w600,),
                    ),
                    16.heightSpace,
                    ...controller.vaccineList.map((time) =>
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  controller.toShow.contains(time['time']) ?
                                      controller.toShow.remove(time['time']) :
                                      controller.toShow.add(time['time']);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: 8.radius
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomText(text: time['time'], fontSize: 16.sp, color: AppColors.textWhite,),
                                      Obx(() =>
                                          controller.toShow.contains(time['time']) ?
                                          Icon(Icons.keyboard_arrow_up_rounded, color: AppColors.textWhite,) :
                                          Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textWhite,)
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Obx(() =>
                                  controller.toShow.contains(time['time']) ?
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ...time['vaccineNames'].map((name) =>
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    value: controller.takenVaccines.contains(name['name']),
                                                    activeColor: AppColors.primary,
                                                    onChanged: (bool? value) {
                                                      //log(name['taken']);
                                                      controller.takenVaccines.contains(name['name']) ?
                                                      controller.takenVaccines.remove(name['name']) :
                                                      controller.takenVaccines.add(name['name']);
                                                    },
                                                  ),
                                                  CustomText(text: name['name'], color: AppColors.textSecondary,)
                                                ],
                                              )
                                          )
                                        ],
                                      ) : SizedBox()
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: CustomSubmitButton(
            text: "Save",
            color: AppColors.warning,
            onTap: (){
              controller.updateChild();
            },
          ),
        ),
      ),
    );
  }
}
