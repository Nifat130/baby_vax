import 'package:baby_vax/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:baby_vax/features/hospital_flow/hospital_nav_bar/presentation/screens/hospital_nav_bar_screen.dart';
import 'package:get/get.dart';import '../features/authentication/presentation/screens/hospital_sign_up_screen.dart';
import '../features/authentication/presentation/screens/parent_sign_up_screen.dart';

import '../features/authentication/presentation/screens/role_screen.dart';
import '../features/health_tips/presentation/screens/baby_care_screen.dart';
import '../features/health_tips/presentation/screens/vaccine_pros_and_cons_screen.dart';
import '../features/hospital_flow/hospital_event/presentation/screens/hospital_event_screen.dart';
import '../features/hospital_flow/hospital_home/presentation/screens/complete_screen.dart';
import '../features/hospital_flow/hospital_home/presentation/screens/hospital_home_screen.dart';
import '../features/hospital_flow/hospital_profile/presentation/screens/hospital_change_password_screen.dart';
import '../features/hospital_flow/hospital_profile/presentation/screens/hospital_information_screen.dart';
import '../features/hospital_flow/hospital_profile/presentation/screens/hospital_profile_screen.dart';
import '../features/hospital_flow/hospital_profile/presentation/screens/legal_and_policies_screen.dart';
import '../features/notification/presentation/screens/notification_screen.dart';
import '../features/onboarding/screens/onboarding_screen_one.dart';
import '../features/onboarding/screens/onboarding_screen_three.dart';
import '../features/onboarding/screens/onboarding_screen_two.dart';
import '../features/parent_flow/google_map/presentation/screens/google_map_screen.dart';
import '../features/parent_flow/parent_event/presentation/screens/parent_event_details_screen.dart';
import '../features/parent_flow/parent_event/presentation/screens/parent_event_screen.dart';
import '../features/parent_flow/parent_home_screen/presentation/screens/add_child_screen.dart';
import '../features/parent_flow/parent_home_screen/presentation/screens/child_details_screen.dart';
import '../features/parent_flow/parent_home_screen/presentation/screens/edit_child_screen.dart';
import '../features/parent_flow/parent_home_screen/presentation/screens/parent_home_screen.dart';
import '../features/parent_flow/parent_nav_bar/presentation/screens/parent_nav_bar_screen.dart';
import '../features/parent_flow/parent_profile/presentation/screens/parent_change_password_screen.dart';
import '../features/parent_flow/parent_profile/presentation/screens/parent_information_screen.dart';
import '../features/parent_flow/parent_schedule_calendar/presentation/screens/parent_schedule_calendar_screen.dart';
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
  static String hospitalChangePasswordScreen = "/hospitalChangePasswordScreen";
  static String legalAndPoliciesScreen = "/legalAndPoliciesScreen";
  static String notificationScreen = "/notificationScreen";
  static String parentHomeScreen = "/parentHomeScreen";
  static String parentNavBarScreen = "/parentNavBarScreen";
  static String parentChangePasswordScreen = "/parentChangePasswordScreen";
  static String parentInformationScreen = "/parentInformationScreen";
  static String addChildScreen = "/addChildScreen";
  static String editChildScreen = "/editChildScreen";
  static String parentEventScreen = "/parentEventScreen";
  static String parentEventDetailsScreen = "/parentEventDetailsScreen";
  static String parentScheduleCalendarScreen = "/parentScheduleCalendarScreen";
  static String childDetailsScreen = "/childDetailsScreen";
  static String googleMapScreen = "/googleMapScreen";
  static String completeScreen = "/completeScreen";
  static String babyCareScreen = "/babyCareScreen";
  static String vaccineProsAndConsScreen = "/vaccineProsAndConsScreen";


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
    GetPage(name: signInScreen, page: () => SignInScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: Duration(milliseconds: 500),),
    GetPage(name: roleScreen, page: () => const RoleScreen()),
    GetPage(name: parentSignUpScreen, page: () => ParentSignUpScreen()),
    GetPage(name: hospitalSignUpScreen, page: () => HospitalSignUpScreen()),
    GetPage(name: hospitalNavBarScreen, page: () => HospitalNavBarScreen()),
    GetPage(name: hospitalHomeScreen, page: () => HospitalHomeScreen()),
    GetPage(name: hospitalProfileScreen, page: () => HospitalProfileScreen()),
    GetPage(name: hospitalEventScreen, page: () => HospitalEventScreen()),
    GetPage(name: hospitalInformationScreen, page: () => HospitalInformationScreen()),
    GetPage(name: hospitalChangePasswordScreen, page: () => HospitalChangePasswordScreen()),
    GetPage(name: legalAndPoliciesScreen, page: () => LegalAndPoliciesScreen()),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: completeScreen, page: () => CompleteScreen()),

    /// Parent Flow
    GetPage(name: parentNavBarScreen, page: () => ParentNavBarScreen()),
    GetPage(name: parentHomeScreen, page: () => ParentHomeScreen()),
    GetPage(name: parentChangePasswordScreen, page: () => ParentChangePasswordScreen()),
    GetPage(name: parentInformationScreen, page: () => ParentInformationScreen()),
    GetPage(name: addChildScreen, page: () => AddChildScreen()),
    GetPage(name: editChildScreen, page: () => EditChildScreen()),
    GetPage(name: parentEventScreen, page: () => ParentEventScreen()),
    GetPage(name: parentEventDetailsScreen, page: () => ParentEventDetailsScreen()),
    GetPage(name: parentScheduleCalendarScreen, page: () => ParentScheduleCalendarScreen()),
    GetPage(name: childDetailsScreen, page: () => ChildDetailsScreen()),
    GetPage(name: googleMapScreen, page: () => GoogleMapScreen()),
    GetPage(name: babyCareScreen, page: () => BabyCareScreen()),
    GetPage(name: vaccineProsAndConsScreen, page: () => VaccineProsAndConsScreen()),
  ];
}
