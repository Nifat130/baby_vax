import 'package:baby_vax/features/hospital_flow/hospital_event/presentation/screens/hospital_event_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../hospital_home/presentation/screens/hospital_home_screen.dart';
import '../../hospital_profile/presentation/screens/hospital_profile_screen.dart';

class HospitalNavBarController extends GetxController{

  var selectedIndex = 0.obs;

  List<Widget> screens = [
    HospitalHomeScreen(),
    HospitalEventScreen(),
    HospitalProfileScreen(),
  ];

}