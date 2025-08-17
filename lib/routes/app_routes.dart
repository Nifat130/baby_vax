
import 'package:baby_vax/features/authentication/presentation/screens/login/password_screen.dart';
import 'package:get/get.dart';
import 'package:baby_vax/features/authentication/presentation/screens/forgotten/create_new_password.dart';
import 'package:baby_vax/features/authentication/presentation/screens/forgotten/forgotten_password.dart';
import 'package:baby_vax/features/authentication/presentation/screens/forgotten/password_change_success.dart';
import 'package:baby_vax/features/onboarding/screens/onboarding_screen_three.dart';
import 'package:baby_vax/features/onboarding/screens/onboarding_screen_two.dart';
import 'package:baby_vax/features/authentication/presentation/screens/sign_up/create_account_screen.dart';
import 'package:baby_vax/features/authentication/presentation/screens/select_role.dart';
import 'package:baby_vax/features/authentication/presentation/screens/sign_up/signup_screen.dart';

import '../features/authentication/presentation/screens/login/login_screen.dart';
import '../features/onboarding/screens/onboarding_screen_one.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String init = "/";
  static String splashScreen = "/splashScreen";

  static String selectRole = "/selectRole";
  static String loginScreen = "/loginScreen";
  static String passwordScreen = "/passwordScreen";

  static String signUpScreen = "/signUpScreen";
  static String signupScreen = "/signupScreen";

  static String verifyScreen = "/verifyScreen";
  static String createAccountScreen = "/createAccountScreen";

  static String forgottenPassword = "/forgottenPassword";
  static String forgottenVerifyScreen = "/forgottenVerifyScreen";
  static String createNewPassword = "/createNewPassword";
  static String passwordChangeSuccess = "/passwordChangeSuccess";

  static String professionalInfo = "/professionalInfo";
  static String documents = "/documents";
  static String preferences = "/preferences";
  static String preferencesSecond = "/preferencesSecond";
  static String complete = "/complete";

  static String profile = "/profile";
  static String personalInforamtion = "/personalInforamtion";
  static String editProfile = "/editProfile";
  static String notification = "/notification";
  static String legalAndPolicies = "/legalAndPolicies";
  static String helpSupport = "/helpSupport";
  static String managePlan = "/managePlan";
  static String credentialsScreen = "/credentialsScreen";
  static String academicQualification = "/academicQualification";
  static String bookmarksScreen = "/bookmarksScreen";
  static String myAvailability = "/myAvailability";
  
  static String sheduleScreen = "/sheduleScreen";



  //! Facility Flow Route =============================================
    static String facilityProfileScreen = "/facilityProfileScreen";
    static String facilityProfileDetails = "/facilityProfileDetails";
    static String facilityProfileEdit = "/facilityProfileEdit";
    static String facilityNotification = "/facilityNotification";
    static String facilityLegalPolicy = "/facilityLegalPolicy";
    static String facilityHelpSupport = "/facilityHelpSupport";
    static String hrDetails = "/hrDetails";

    
    static String facilityScheduleScreen = "/facilityScheduleScreen";
    static String facilitesProviderScreen = "/facilitesProviderScreen";
    
    static String facilitesProfile = "/facilitesProfile";
    static String profileSetupIndicator = "/profileSetupIndicator";
    static String facilityReviewScreen = "/facilityReviewScreen";
    static String facilitiesCreateJobPostScreen = "/facilitiesCreateJobPostScreen";




  // Added By Nifat

  static String onboardingScreenOne = "/onboardingScreenOne";
  static String onboardingScreenTwo = "/onboardingScreenTwo";
  static String onboardingScreenThree = "/onboardingScreenThree";
  static String promotionScreen = "/promotionScreen";
  static String createPromotionScreen = "/createPromotionScreen";
  static String createPromotionScreenTwo = "/createPromotionScreenTwo";
  static String communityScreen = "/communityScreen";
  static String postDetailsScreen = "/postDetailsScreen";
  static String createPostScreen = "/createPostScreen";
  static String messageScreen = "/messageScreen";
  static String callScreen = "/callScreen";
  static String chatScreen = "/chatScreen";
  static String facilitiesProfileSetupScreen = "/facilitiesProfileSetupScreen";
  static String facilitiesProfileSettingsScreen = "/facilitiesProfileSettingsScreen";
  static String reviewScreen = "/reviewScreen";

  // Added by Shahriar
  static String navBarScreen = "/navBarScreen";
  static String facilitiesNavBar = "/facilitiesNavBar";
  static String notificationScreen = "/notificationScreen";
  static String subscriptionScreen = "/subscriptionScreen";
  static String jobDetailsScreen = "/jobDetailsScreen";
  static String tabBar = "/tabBar";
  static String profileHomeScreen = "/profileHomeScreen";
  static String confirmationScreen = "/confirmationScreen";
  static String searchScreen = "/searchScreen";
  static String applyBostonMedicalCenterScreen = "/applyBostonMedicalCenterScreen";
  static String facilitiesJobDetailsScreen = "/facilitiesJobDetailsScreen";
  static String jobRequestScreen = "/jobRequestScreen";
  static String viewPromotionContentScreen = "/viewPromotionContentScreen";

  //static String scheduleUpcoming = "/scheduleUpcoming";


  static List<GetPage> routes = [
    GetPage(name: init, page: () => SplashScreen()),

    GetPage(
      name: selectRole,
      page: () =>  SelectRole(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: passwordScreen, page: () => PasswordScreen()),

    GetPage(name: signupScreen, page: () => SignupScreen()),
    GetPage(name: createAccountScreen, page: () => CreateAccountScreen()),

    GetPage(name: forgottenPassword, page: () => ForgottenPassword()),
    GetPage(name: createNewPassword, page: () => CreateNewPassword()),
    GetPage(name: passwordChangeSuccess, page: () => PasswordChangeSuccess()),


    // GetPage(name: profileSetupIndicator, page: () => profileSetupIndicator()),

    /// Added By Nifat
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
    GetPage(
      name: onboardingScreenThree,
      page: () => const OnboardingScreenThree(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),

  ];
}
