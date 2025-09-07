import 'package:baby_vax/core/common/widgets/custom_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/controllers/hospital_event_controller.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/presentation/widgets/event_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalEventScreen extends GetView<HospitalEventController> {
  const HospitalEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeading(title: "Event List"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Obx((){
                if(controller.isLoading.value){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                    child: CustomProgressIndicator(),
                  );
                }
                else if(controller.myEvents.isEmpty){
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                      child: CustomText(text: "No events created yet", color: AppColors.textSecondary,),
                    ),
                  );
                }
                else{
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...controller.myEvents.map((event) =>
                            eventContainer(controller, event)
                        )
                      ],
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
