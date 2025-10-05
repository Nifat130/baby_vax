import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../controllers/new_child_details_controller.dart';

class NewChildDetailsCalenderWidget extends GetView<NewChildDetailsController> {
  const NewChildDetailsCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: TableCalendar(
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 16.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          weekendStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          holidayTextStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          selectedTextStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColors.textWhite,
            fontWeight: FontWeight.w600,
          ),
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          todayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withAlpha(100),
          ),
          todayTextStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        weekendDays: [],
        firstDay: controller.child.birthDate!,
        lastDay: controller.dateOfNextDose,
        focusedDay: DateTime.now(),
        enabledDayPredicate: (day) => true,
        selectedDayPredicate: (day) =>
            isSameDay(DateTime.now(), day),
        calendarFormat: CalendarFormat.month,
        onDaySelected: (selectedDay, focusedDay) async {
          //calendarController.loadEvents(selectedDay);
          // log(selectedDay.toString());
          // log(focusedDay.toString());
          // controller.focusedDay.value = focusedDay;
          // controller.getSelectedDateEvents();
        },
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            for (var dose in controller.alreadyTakenDoses) {
              if ((DateTime.parse(dose.givenDate!)).day == day.day && (DateTime.parse(dose.givenDate!)).month == day.month) {
                // Found a scheduled day, return custom styled text
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.success
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    child: CustomText(
                      text: '${day.day}',
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                );
              }
            }
            if (controller.dateOfNextDose.day == day.day && controller.dateOfNextDose.month == day.month) {
              // Found a scheduled day, return custom styled text
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.warning
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  child: CustomText(
                    text: '${day.day}',
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
