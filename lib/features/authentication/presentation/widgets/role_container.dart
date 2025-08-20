import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/logo_path.dart';
import 'package:baby_vax/features/authentication/controllers/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';

Widget roleContainer(SignUpController controller, String role, String icon){

  return Obx(()=>
      GestureDetector(
        onTap: (){
          controller.selectedRole.value = role;
        },
        child: Container(
          decoration: BoxDecoration(
              color: controller.selectedRole.value == role ? AppColors.primary : AppColors.textWhite,
              borderRadius: 8.radius,
              border: Border.all(color: controller.selectedRole.value == role ? AppColors.secondary : AppColors.textFormFieldBorder)
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16.w,
            children: [
              Image.asset(icon, color: controller.selectedRole.value == role ? AppColors.textWhite : AppColors.textSecondary,),
              CustomText(text: role, fontSize: 18.sp, textAlign: TextAlign.start, color: controller.selectedRole.value == role ? AppColors.textWhite : AppColors.textSecondary, fontWeight: FontWeight.w600,)
            ],
          ),
        ),
      )
  );
}