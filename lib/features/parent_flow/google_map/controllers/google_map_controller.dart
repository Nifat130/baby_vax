

import 'dart:async';

import 'package:baby_vax/core/utils/logging/logger.dart';
import 'package:baby_vax/data/hospital_flow/get_events_model.dart';
import 'package:baby_vax/data/hospital_flow/get_parent_information_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../parent_home_screen/controllers/parent_home_controller.dart';

class GoogleMapScreenController extends GetxController{

  var isLoading = false.obs;

  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition position;


  var event = GetEventsModel();
  var myInformation = GetParentInformationModel();
  var parentHomeController = Get.find<ParentHomeController>();


  List<Marker> markerList = <Marker>[];

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
              )
          )
      );

      final location = await locationFromAddress(event.hospitalInfo!.hospitalAddress!);
      markerList.add(
          Marker(
              markerId: MarkerId(event.hospitalInfo!.hospitalName!),
              position: LatLng(location.first.latitude!, location.first.longitude!),
              infoWindow: InfoWindow(
                  title: event.hospitalInfo!.hospitalName!
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
          )
      );
    }catch(e){
      AppLoggerHelper.error(e.toString());
    }
  }
}
