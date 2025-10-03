import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../controllers/new_child_details_controller.dart';

class NewChildDetailsListWidget extends GetView<NewChildDetailsController> {
  const NewChildDetailsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      margin: EdgeInsets.only(bottom: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Obx(()=>
                                  Checkbox(
                                    value: controller.takenDoses.contains(time['time']),
                                    side: BorderSide(color: AppColors.textWhite),
                                    activeColor: AppColors.warning,
                                    onChanged: (value){
                                      controller.takenDoses.contains(time["time"]) ?
                                      controller.takenDoses.remove(time['time']) :
                                      controller.takenDoses.add(time['time']);
                                    },
                                  )
                              ),
                              CustomText(text: time['time'], fontSize: 16.sp, color: AppColors.textWhite,),
                            ],
                          ),
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            child: CustomText(text: "👉  ${name['name']}", color: AppColors.textSecondary, fontSize: 16.sp,),
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
    );
  }
}
