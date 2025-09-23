import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/icon_path.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/presentation/widgets/parent_children_container.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/presentation/widgets/parent_home_appbar.dart';
import 'package:baby_vax/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/parent_home_controller.dart';

class ParentHomeScreen extends GetView<ParentHomeController> {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.profileIsLoading.value) {
                return parentHomeAppbar(
                  "Abdullah Talukdar",
                  "Mirpur 10, Dhaka",
                  ImagePath.dummyProfilePicture,
                  controller.profileIsLoading.value,
                );
              } else {
                final information = controller.myInformation.profileDetails!;
                return parentHomeAppbar(
                  information.parentName!,
                  information.parentAddress!.fullAddress!,
                  information.parentProfilePicture!,
                  controller.profileIsLoading.value,
                );
              }
            }),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        info(image: IconPath.babyCareIcon, name: "Care", route: AppRoute.babyCareScreen),
                        info(image: IconPath.prosConsIcon, name: "Insights", route: AppRoute.vaccineProsAndConsScreen),
                        info(image: IconPath.effectIcon, name: "Effects", route: AppRoute.vaccineEffectsScreen),
                      ],
                    ),
                    16.heightSpace,
                    CustomText(
                      text: "List of children",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    16.heightSpace,
                    Obx(() {
                      if (controller.childrenListIsLoading.value) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.height / 4,
                          ),
                          child: CustomProgressIndicator(),
                        );
                      } else if (controller.children.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: CustomText(
                              text: "No child added yet",
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...controller.children.map((child) {
                              return parentChildrenContainer(child);
                            }),
                          ],
                        );
                      }
                    }),
                    16.heightSpace,
                    CustomSubmitButton(
                      text: "Add Child",
                      onTap: () {
                        Get.toNamed(AppRoute.addChildScreen);
                      },
                    ),
                    16.heightSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget info({
    required String image,
    required String name,
    required String route,
}) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(route);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: 4.radius,
              border: Border.all(color: AppColors.textPrimary),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight,
              height: 40.h,
            ),
          ),
          8.heightSpace,
          CustomText(text: name, fontWeight: FontWeight.w500),
        ],
      ),
    );
  }
}
