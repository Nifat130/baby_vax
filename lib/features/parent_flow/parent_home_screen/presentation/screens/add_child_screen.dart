import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/controllers/add_child_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChildScreen extends GetView<AddChildController> {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          customBackCenterTitleHeading("Add Child"),
          Container(
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

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: CustomSubmitButton(
            text: "Save",
            onTap: (){},
          ),
        ),
      ),
    );
  }
}
