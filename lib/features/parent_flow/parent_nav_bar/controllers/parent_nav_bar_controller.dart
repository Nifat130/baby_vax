import 'package:baby_vax/features/hospital_flow/hospital_event/presentation/screens/hospital_event_screen.dart';
import 'package:baby_vax/features/hospital_flow/hospital_profile/presentation/screens/hospital_profile_screen.dart';
import 'package:baby_vax/features/parent_flow/parent_home_screen/presentation/screens/parent_home_screen.dart';
import 'package:baby_vax/features/parent_flow/parent_profile/presentation/screens/parent_information_screen.dart';
import 'package:baby_vax/features/parent_flow/parent_profile/presentation/screens/parent_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ParentNavBarController extends GetxController{

  var selectedIndex = 0.obs;

  List<Widget> screens = [
    ParentHomeScreen(),
    SizedBox(),
    ParentProfileScreen(),
  ];

}