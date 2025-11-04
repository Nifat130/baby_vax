import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Theme customPickerTheme(BuildContext context, Widget child){

  return Theme(
      data: Theme.of(context).copyWith(
        textTheme: TextTheme(
          headlineMedium: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textPrimary,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16.sp,
            color: Colors.teal,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: AppColors.primary, // header background color
          onPrimary: AppColors.textWhite, // header text color
          onSurface: Colors.black, // default text color
        ),
      ),
      child: child,);

}