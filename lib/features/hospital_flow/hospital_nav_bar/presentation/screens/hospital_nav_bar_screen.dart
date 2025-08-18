import 'package:baby_vax/core/common/widgets/nav_bar_button_widget.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/icon_path.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/hospital_nav_bar_controller.dart';

class HospitalNavBarScreen extends GetView<HospitalNavBarController> {
  const HospitalNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
        controller.screens[controller.selectedIndex.value]
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: CurvedNavigationBar(
          color: AppColors.primary,
          onTap: (index){
            controller.selectedIndex.value = index;
          },
          backgroundColor: AppColors.textWhite,
          items: [
            navBarButtonWidget(IconPath.homeIcon, "Home"),
            navBarButtonWidget(IconPath.eventIcon, "Event"),
            navBarButtonWidget(IconPath.profileIcon, "Profile"),
          ],
        ),
      ),
    );
  }
}
