import 'package:baby_vax/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:get/get.dart';
import '../features/onboarding/screens/onboarding_screen_one.dart';
import '../features/onboarding/screens/onboarding_screen_three.dart';
import '../features/onboarding/screens/onboarding_screen_two.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {
  static String init = "/";
  static String splashScreen = "/splashScreen";

  static String selectRole = "/selectRole";
  static String signInScreen = "/signInScreen";
  static String passwordScreen = "/passwordScreen";

  static String signUpScreen = "/signUpScreen";
  static String signupScreen = "/signupScreen";

  static String verifyScreen = "/verifyScreen";
  static String createAccountScreen = "/createAccountScreen";


  // Added By Nifat

  static String onboardingScreenOne = "/onboardingScreenOne";
  static String onboardingScreenTwo = "/onboardingScreenTwo";
  static String onboardingScreenThree = "/onboardingScreenThree";

  //static String scheduleUpcoming = "/scheduleUpcoming";


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
    GetPage(name: signInScreen, page: () => const SignInScreen(), transition: Transition.rightToLeftWithFade, transitionDuration: Duration(milliseconds: 500),),

  ];
}
