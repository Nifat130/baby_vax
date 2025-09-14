import 'package:baby_vax/core/common/widgets/custom_back_center_title_heading.dart';
import 'package:baby_vax/core/common/widgets/custom_progress_indicator.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/google_map_controller.dart';

class GoogleMapScreen extends GetView<GoogleMapScreenController> {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Obx(()=>
          controller.isLoading.value ?
              Padding(
                padding: EdgeInsets.symmetric(vertical: SizeUtils.height / 3),
                child: CustomProgressIndicator(),
              ) :
          Stack(
            children: [
              GoogleMap(
                initialCameraPosition: controller.position,
                markers: Set<Marker>.of(controller.markerList),
                polylines: controller.polyline,
                onMapCreated: (GoogleMapController mapController){
                  controller.mapController.complete(mapController);
                },
                myLocationEnabled: true,
              ),
              customBackCenterTitleHeading("See in Map")
            ],
          )
        ),
      ),
    );
  }
}
