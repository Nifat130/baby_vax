import 'dart:developer';

import 'package:baby_vax/core/common/app_snackber.dart';
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
                          color: controller.nextDose.value == time['time'] ? AppColors.warning : AppColors.textSecondary,
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
                                    value: controller.takenDoses.any((dose) => dose["doseTime"] == time['time']),
                                    side: BorderSide(color: AppColors.textWhite),
                                    checkColor: AppColors.warning,
                                    activeColor: controller.nextDose.value == time["time"] ? AppColors.textWhite : AppColors.warning,
                                    onChanged: (value){
                                      var dose = controller.vaccineList.where((vaccine) => vaccine['time'] == time['time']).single;
                                      log(dose.toString());
                                      var body = {
                                        "doseTime" : time["time"],
                                        "givenDate" : DateTime.now().toUtc().toIso8601String()
                                      };
                                      if(controller.nextDose.value == time['time']){
                                        if(controller.takenDoses.any((vaccine) => vaccine['doseTime'] == time['time'])){
                                          controller.takenDoses.removeWhere((vaccine) => vaccine['doseTime'] == time['time']);
                                          for (var subVaccine in dose['vaccineNames'] as List<Map<String, dynamic>>) {
                                            controller.takenVaccines.remove(subVaccine['name']);
                                          }
                                        }
                                        else{
                                          controller.takenDoses.add(body);
                                          for (var subVaccine in dose['vaccineNames'] as List<Map<String, dynamic>>) {
                                            controller.takenVaccines.add(subVaccine['name']);
                                          }
                                        }
                                        log(controller.takenDoses.toString());
                                        log(controller.takenVaccines.toString());
                                      }
                                      else{
                                        AppSnackBar.showError("Provide previous vaccines");
                                      }
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
