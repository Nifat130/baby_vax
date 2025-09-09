import 'dart:developer';
import 'package:baby_vax/core/common/widgets/custom_heading.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/features/parent_flow/parent_event/presentation/widgets/parent_event_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../controllers/parent_schedule_calendar_controller.dart';

class ParentScheduleCalendarScreen extends GetView<ParentScheduleCalendarController> {
  const ParentScheduleCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeading(title: "Event Schedule"),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => TableCalendar(
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
                        firstDay: DateTime.now(),
                        lastDay: DateTime.now().add(Duration(days: 30)),
                        focusedDay: controller.focusedDay.value,
                        enabledDayPredicate: (day) => true,
                        selectedDayPredicate: (day) =>
                            isSameDay(controller.focusedDay.value, day),
                        calendarFormat: CalendarFormat.month,
                        onDaySelected: (selectedDay, focusedDay) async {
                          //calendarController.loadEvents(selectedDay);
                          log(selectedDay.toString());
                          log(focusedDay.toString());
                          controller.focusedDay.value = focusedDay;
                          controller.getSelectedDateEvents();
                        },
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            for (var date in controller.scheduledDays) {
                              if (date['date'] == day.day) {
                                log(day.day.toString());
                                // Found a scheduled day, return custom styled text
                                return Center(
                                  child: CustomText(
                                    text: '${day.day}',
                                    color: AppColors.warning,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                );
                              }
                            }
                            return null;
                          },

                        ),
                      ),
                    ),
                    24.heightSpace,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withAlpha(200),
                        borderRadius: 99.radius
                      ),
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      alignment: Alignment.center,
                      child: CustomText(text: "Event List", fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColors.textWhite, textAlign: TextAlign.center,),
                    ),
                    16.heightSpace,
                    Obx(() =>
                        controller.selectedDayEvent.isEmpty ?
                            SizedBox() : SizedBox()
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     ...controller.selectedDayEvent.map((event) =>
                            //         parentEventContainer(controller, event)
                            //     )
                            //   ],
                            // )
                    ),
                    16.heightSpace
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
