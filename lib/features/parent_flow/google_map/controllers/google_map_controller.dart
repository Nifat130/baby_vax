

import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:baby_vax/core/utils/constants/app_colors.dart';
import 'package:baby_vax/core/utils/constants/app_sizer.dart';
import 'package:baby_vax/core/utils/constants/icon_path.dart';
import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:baby_vax/data/hospital_flow/get_events_model.dart';
import 'package:baby_vax/data/hospital_flow/get_parent_information_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../parent_home_screen/controllers/parent_home_controller.dart';

class GoogleMapScreenController extends GetxController{

  var isLoading = false.obs;

  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition position;


  var event = GetEventsModel();
  var myInformation = GetParentInformationModel();
  var parentHomeController = Get.find<ParentHomeController>();


  List<Marker> markerList = <Marker>[];

  var points = <LatLng>[];
  var polyline = HashSet<Polyline>();


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    if(Get.arguments != null){
      myInformation = parentHomeController.myInformation;
      event = Get.arguments;
      await fetchingData();
    }
    isLoading.value = false;
  }

  Future<void> fetchingData() async{
    try{
      position = CameraPosition(
          target: LatLng(myInformation.profileDetails!.parentAddress!.lat!, myInformation.profileDetails!.parentAddress!.long!),
          zoom: 15
      );

      markerList.add(
          Marker(
              markerId: MarkerId(myInformation.profileDetails!.parentName!),
              position: LatLng(myInformation.profileDetails!.parentAddress!.lat!, myInformation.profileDetails!.parentAddress!.long!),
              infoWindow: InfoWindow(
                  title: "Me"
              ),
            icon: await BitmapDescriptor.asset(ImageConfiguration(size: Size(45.w, 45.h)), IconPath.myMapIcon)
          )
      );

      points.add(
          LatLng(myInformation.profileDetails!.parentAddress!.lat!, myInformation.profileDetails!.parentAddress!.long!)
      );

      final location = await locationFromAddress(event.hospitalInfo!.hospitalAddress!);
      markerList.add(
          Marker(
              markerId: MarkerId(event.hospitalInfo!.hospitalName!),
              position: LatLng(location.first.latitude, location.first.longitude),
              infoWindow: InfoWindow(
                  title: event.hospitalInfo!.hospitalName!
              ),
              icon: await BitmapDescriptor.asset(ImageConfiguration(size: Size(45.w, 45.h)), IconPath.hospitalMapIcon)
          )
      );
      points.add(LatLng(location.first.latitude, location.first.longitude));

      // polyline.add(
      //   Polyline(
      //     polylineId: PolylineId("1"),
      //     points: points,
      //     color: AppColors.textBlue,
      //     width: 4
      //   )
      // );

      await _getRouteFromOSRM(points[0], points[1]);

    }catch(e){
      AppLoggerHelper.error(e.toString());
    }
  }


  Future<void> _getRouteFromOSRM(LatLng start, LatLng end) async {
    try {
      final url =
          "http://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final route = data['routes'][0]['geometry']['coordinates'] as List;

        // Convert to LatLng list
        List<LatLng> polyPoints = route
            .map((point) => LatLng(point[1].toDouble(), point[0].toDouble()))
            .toList();

        polyline.clear(); // clear old line
        polyline.add(
          Polyline(
            polylineId: const PolylineId("osrm_route"),
            points: polyPoints,
            color: AppColors.textBlue,
            width: 4,
          ),
        );
      } else {
        AppLoggerHelper.error("OSRM Error: ${response.body}");
      }
    } catch (e) {
      AppLoggerHelper.error("OSRM Exception: $e");
    }
  }

}
