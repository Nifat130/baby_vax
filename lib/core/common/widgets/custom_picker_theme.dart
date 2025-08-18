import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData customPickerTheme(BuildContext context){

  return Theme.of(context).copyWith(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,        // header background + selected elements
      onPrimary: Colors.white,     // text/icon color on primary
      onSurface: Colors.black,     // default text color
    ),
    dialogBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.teal,
        textStyle: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary
        ),
      ),
    ),

    // 👇 Change date picker text style (calendar days, year, etc.)
    textTheme:  TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary
      ),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary
      ),
      labelLarge: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary
      ),
    ),

    // 👇 Change time picker (AM/PM, hour/minute)
    timePickerTheme: TimePickerThemeData(
      hourMinuteTextStyle: GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary
      ),
      dayPeriodTextStyle: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary
      ),
      dialHandColor: AppColors.primary,        // clock hand
      dialBackgroundColor: Colors.teal.shade50,
      hourMinuteTextColor: AppColors.primary,
      dayPeriodTextColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.selected)
            ? Colors.white // selected AM/PM
            : AppColors.secondary, // unselected AM/PM
      ),
      dayPeriodShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
  ;
}