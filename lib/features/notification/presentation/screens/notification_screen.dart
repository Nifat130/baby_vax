import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/common/widgets/custom_text.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/notification_controller.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          customBackCenterTitleHeading("Notification"),
          /// Notification List
          Obx((){
            if(controller.isLoading.value){
              return Padding(
                padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                child: CustomProgressIndicator(),
              );
            }
            else if(controller.notificationList.isEmpty){
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                  child: CustomText(text: "No notification"),
                ),
              );
            }
            else{
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  itemCount: controller.notificationList.length,
                  itemBuilder: (context, index) {
                    final item = controller.notificationList[index];
                    return notificationTile(
                      title: item["title"].toString(),
                      subtitle: item["subtitle"].toString(),
                      isUnread: true,
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
