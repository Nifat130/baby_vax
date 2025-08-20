import 'package:baby_vax/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:baby_vax/features/hospital_flow/hospital_nav_bar/presentation/screens/hospital_nav_bar_screen.dart';
import 'package:get/get.dart';import '../features/authentication/presentation/screens/hospital_sign_up_screen.dart';
import '../features/authentication/presentation/screens/parent_sign_up_screen.dart';

import '../features/authentication/presentation/screens/role_screen.dart';
import '../features/hospital_flow/hospital_event/presentation/screens/hospital_event_screen.dart';
import '../features/hospital_flow/hospital_home/presentation/screens/hospital_home_screen.dart';
import '../features/hospital_flow/hospital_profile/presentation/screens/hospital_information_screen.dart';
import '../features/hospital_flow/hospital_profile/presentation/screens/hospital_profile_screen.dart';
import '../features/onboarding/screens/onboarding_screen_one.dart';
import '../features/onboarding/screens/onboarding_screen_three.dart';
import '../features/onboarding/screens/onboarding_screen_two.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String init = "/";
  static String roleScreen = "/roleScreen";
  static String signInScreen = "/signInScreen";
  static String parentSignUpScreen = "/parentSignUpScreen";
  static String onboardingScreenOne = "/onboardingScreenOne";
  static String onboardingScreenTwo = "/onboardingScreenTwo";
  static String onboardingScreenThree = "/onboardingScreenThree";
  static String hospitalSignUpScreen = "/hospitalSignUpScreen";
  static String hospitalNavBarScreen = "/hospitalNavBarScreen";
  static String hospitalHomeScreen = "/hospitalHomeScreen";
  static String hospitalProfileScreen = "/hospitalProfileScreen";
  static String hospitalEventScreen = "/hospitalEventScreen";
  static String hospitalInformationScreen = "/hospitalInformationScreen";


  static List<GetPage> routes = [
    GetPage(name: init, page: () => SplashScreen()),
    GetPage(
      name: onboardingScreenOne,
      page: () => const OnboardingScreenOne(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: onboardingScreenTwo,
      page: () => const OnboardingScreenTwo(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(name: onboardingScreenThree, page: () => const OnboardingScreenThree(), transition: Transition.rightToLeftWithFade, transitionDuration: Duration(milliseconds: 500),),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: roleScreen, page: () => const RoleScreen()),
    GetPage(name: parentSignUpScreen, page: () => ParentSignUpScreen()),
    GetPage(name: hospitalSignUpScreen, page: () => HospitalSignUpScreen()),
    GetPage(name: hospitalNavBarScreen, page: () => HospitalNavBarScreen()),
    GetPage(name: hospitalHomeScreen, page: () => HospitalHomeScreen()),
    GetPage(name: hospitalProfileScreen, page: () => HospitalProfileScreen()),
    GetPage(name: hospitalEventScreen, page: () => HospitalEventScreen()),
    GetPage(name: hospitalInformationScreen, page: () => HospitalInformationScreen()),

  ];
}
