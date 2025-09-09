import 'package:baby_vax/core/common/widgets/custom_dropdown.dart';
import 'package:baby_vax/core/common/widgets/custom_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/parent_flow/parent_event/controllers/parent_event_controller.dart';
import 'package:baby_vax/features/parent_flow/parent_event/presentation/widgets/parent_event_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentEventScreen extends GetView<ParentEventController> {
  const ParentEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeading(title: "Events"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() =>
                        CustomDropdownField(
                          hintText: "Search with vaccine type",
                          items: controller.vaccinesType,
                          selectedValue: controller.selectedVaccineType.value,
                          onChanged: (newValue){
                            controller.selectedVaccineType.value = newValue;
                            controller.search();
                          },
                        )
                    ),
                    16.heightSpace,
                    Obx((){
                      if(controller.isLoading.value){
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                          child: CustomProgressIndicator(),
                        );
                      }
                      else if(controller.vaccineEvents.isEmpty){
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                            child: CustomText(text: "No events found", textAlign: TextAlign.center, color: AppColors.textSecondary,),
                          ),
                        );
                      }
                      else{
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...controller.vaccineEvents.map((event) =>
                                parentEventContainer(controller, event)
                            )
                          ],
                        );
                      }
                    }
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
