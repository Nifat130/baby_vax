import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/presentation/widgets/parent_children_container.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/presentation/widgets/parent_home_appbar.dart';
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
            parentHomeAppbar("Abdullah Talukdar", "Mirpur 10, Dhaka", ImagePath.dummyProfilePicture),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "List of children", fontSize: 18.sp, fontWeight: FontWeight.w500,),
                  16.heightSpace,
                  parentChildrenContainer("Kuddus Mia", "2 Years", "2234n5a3434"),
                  parentChildrenContainer("Sadik Mia", "1 Years", "2234n5a3434"),
                  parentChildrenContainer("Badik Mia", "6 Months", "2234n5a3434"),
                  16.heightSpace,
                  CustomSubmitButton(
                    text: "Add Child",
                    onTap: (){},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
