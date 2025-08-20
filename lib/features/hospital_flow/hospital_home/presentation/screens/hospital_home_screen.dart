import 'package:baby_vax/core/common/widgets/custom_dropdown.dart';
import 'package:baby_vax/core/common/widgets/custom_submit_button.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/common/widgets/custom_textformfield.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/image_path.dart';
import 'package:baby_vax/core/utils/validators/app_validator.dart';
import 'package:baby_vax/features/hospital_flow/hospital_home/presentation/widgets/hospital_home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controllers/hospital_home_controller.dart';

class HospitalHomeScreen extends GetView<HospitalHomeController> {
  const HospitalHomeScreen({super.key});

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
                hospitalHomeAppbar("Dhaka Hospital", "Shewrapara, Mirpur, Dhaka", ImagePath.dummyProfilePicture),
                16.heightSpace,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: 8.radius,
                    border: Border.all(color: AppColors.textFormFieldBorder)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Vaccine Name", fontSize: 12.sp, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.vaccineName,
                        hintText: "Enter vaccine name",
                        validator: (value) => AppValidator.validateField(value, "Name"),
                      ),
                      16.heightSpace,
                      CustomText(text: "Vaccine Type", fontSize: 12.sp, color: AppColors.textSecondary,),
                      8.heightSpace,
                      Obx(() =>
                          CustomDropdownField(
                            items: controller.vaccineType,
                            hintText: "Select vaccine type",
                            onChanged: (value){
                              controller.selectedVaccineType.value = value;
                            },
                            selectedValue: controller.selectedVaccineType.value,
                          )
                      ),
                      16.heightSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Age Limit", fontSize: 12.sp, color: AppColors.textSecondary,),
                                8.heightSpace,
                                CustomTextFormField(
                                  controller: controller.maxAge,
                                  hintText: "Enter age limit",
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  validator: (value) => AppValidator.validateField(value, "Age limit"),
                                ),
                              ],
                            ),
                          ),
                          8.widthSpace,
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Age Unit", fontSize: 12.sp, color: AppColors.textSecondary,),
                                8.heightSpace,
                                Obx(() =>
                                    CustomDropdownField(
                                      items: controller.ageUnit,
                                      hintText: "Select age unit",
                                      onChanged: (value){
                                        controller.selectedAgeUnit.value = value;
                                      },
                                      selectedValue: controller.selectedAgeUnit.value,
                                    )
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      16.heightSpace,
                      CustomText(text: "Vaccine Name", fontSize: 12.sp, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.eventDate,
                        hintText: "Enter event time",
                        readonly: true,
                        prefixIcon: GestureDetector(
                          onTap: (){
                            controller.pickDate(context);
                          },
                          child: Icon(Icons.calendar_month_outlined, color: AppColors.textSecondary,),
                        ),
                        validator: (value) => AppValidator.validateField(value, "Date"),
                      ),
                      16.heightSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Start Time", fontSize: 12.sp, color: AppColors.textSecondary,),
                                8.heightSpace,
                                CustomTextFormField(
                                  controller: controller.eventStart,
                                  hintText: "Start",
                                  readonly: true,
                                  prefixIcon: GestureDetector(
                                    onTap: (){
                                      controller.pickTime(context, "Start");
                                    },
                                    child: Icon(Icons.access_time_outlined, color: AppColors.textSecondary,),
                                  ),
                                  validator: (value) => AppValidator.validateField(value, "Start time"),
                                ),
                              ],
                            ),
                          ),
                          8.widthSpace,
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "End Time", fontSize: 12.sp, color: AppColors.textSecondary,),
                                8.heightSpace,
                                CustomTextFormField(
                                  controller: controller.eventEnd,
                                  hintText: "End",
                                  readonly: true,
                                  prefixIcon: GestureDetector(
                                    onTap: (){
                                      controller.pickTime(context, "End");
                                    },
                                    child: Icon(Icons.access_time_outlined, color: AppColors.textSecondary,),
                                  ),
                                  validator: (value) => AppValidator.validateField(value, "End time"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      16.heightSpace,
                      CustomText(text: "In Charge Name", fontSize: 12.sp, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.inChargeName,
                        hintText: "Enter in charge name",
                        validator: (value) => AppValidator.validateField(value, "In charge name"),
                      ),
                      16.heightSpace,
                      CustomText(text: "In Charge Contact", fontSize: 12.sp, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.inChargeContact,
                        hintText: "Enter in charge contact",
                        validator: (value) => AppValidator.validateField(value, "In charge contact"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      16.heightSpace,
                      CustomText(text: "Event Description", fontSize: 12.sp, color: AppColors.textSecondary,),
                      8.heightSpace,
                      CustomTextFormField(
                        controller: controller.eventDescription,
                        hintText: "Write here...",
                        maxLines: 4,
                        validator: (value) => AppValidator.validateField(value, "Description"),
                      ),
                    ],
                  ),
                ),
                16.heightSpace,
                CustomSubmitButton(
                  text: "Create Event",
                  onTap: (){},
                ),
                32.heightSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
