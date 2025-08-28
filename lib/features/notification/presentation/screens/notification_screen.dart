import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  Widget notificationTile({
    required String title,
    required String subtitle,
    required String time,
    bool isUnread = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left Icon (Baby themed color)
          CircleAvatar(
            radius: 22.h,
            backgroundColor: AppColors.primary.withAlpha(25),
            child: Icon(Icons.vaccines, color: AppColors.primary, size: 20.sp),
          ),
          12.widthSpace,

          /// Title + Subtitle + Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                4.heightSpace,
                CustomText(
                  text: subtitle,
                  fontSize: 13.sp,
                  color: AppColors.textSecondary,
                  maxLines: 2,
                ),
                6.heightSpace,
                CustomText(
                  text: time,
                  fontSize: 11.sp,
                  color: AppColors.textSecondary.withAlpha(175),
                ),
                4.heightSpace,
              ],
            ),
          ),

          /// Unread Indicator
          // if (isUnread)
          //   Padding(
          //     padding: EdgeInsets.only(left: 6.w, top: 6.h),
          //     child: CircleAvatar(
          //       radius: 4.h,
          //       backgroundColor: AppColors.primary,
          //     ),
          //   ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Polio Vaccine Reminder",
        "subtitle": "Your child’s next Polio vaccine is scheduled.",
        "time": "09:00 AM   15/04/2025",
        "unread": true,
      },
      {
        "title": "Hospital Event",
        "subtitle": "Free vaccination camp at City Hospital.",
        "time": "10:30 AM   16/04/2025",
        "unread": false,
      },
      {
        "title": "Appointment Reminder",
        "subtitle": "Doctor visit scheduled for tomorrow.",
        "time": "02:00 PM   17/04/2025",
        "unread": true,
      },
      {
        "title": "BCG Vaccine Completed",
        "subtitle": "BCG vaccine successfully administered.",
        "time": "11:00 AM   10/04/2025",
        "unread": false,
      },
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          customBackCenterTitleHeading("Notification"),
          /// Notification List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return notificationTile(
                  title: item["title"] as String,
                  subtitle: item["subtitle"] as String,
                  time: item["time"] as String,
                  isUnread: item["unread"] as bool,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
