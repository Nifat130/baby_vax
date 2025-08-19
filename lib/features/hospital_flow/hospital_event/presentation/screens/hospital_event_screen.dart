import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/controllers/hospital_event_controller.dart';
import 'package:baby_vax/features/hospital_flow/hospital_event/presentation/widgets/event_container.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalEventScreen extends GetView<HospitalEventController> {
  const HospitalEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(text: "Event List", fontSize: 20.sp, fontWeight: FontWeight.w500,),
                ),
                30.heightSpace,
                eventContainer(),
                eventContainer(),
                eventContainer(),
                eventContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
