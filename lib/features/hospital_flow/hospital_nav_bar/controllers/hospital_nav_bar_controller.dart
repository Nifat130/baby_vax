import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../hospital_home/presentation/screens/hospital_home_screen.dart';

class HospitalNavBarController extends GetxController{

  var selectedIndex = 0.obs;

  List<Widget> screens = [
    HospitalHomeScreen(),
    SizedBox(),
    SizedBox(),
  ];

}