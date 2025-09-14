import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/notification_controller.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Polio Vaccine Reminder",
        "subtitle": "Your child’s next Polio vaccine is scheduled.",
      },
      {
        "title": "Hospital Event",
        "subtitle": "Free vaccination camp at City Hospital.",
        "time": "10:30 AM   16/04/2025",
      },
      {
        "title": "Appointment Reminder",
        "subtitle": "Doctor visit scheduled for tomorrow.",
      },
      {
        "title": "BCG Vaccine Completed",
        "subtitle": "BCG vaccine successfully administered.",
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
                  isUnread: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
