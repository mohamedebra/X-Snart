
import 'package:get/get.dart';
import 'package:smart_watch/features/auth/login_screen.dart';

import '../../features/auth/sign_up_screen.dart';
import '../../features/splash/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String intro = '/intro';
  static const String signUp = '/sign-up';

  static const String introLogin = '/introLogin';
  static const String dashboard = '/dashboard';
  static const String homeScreen = '/homeScreen';
  static const String homeTenantScreen = '/homeTenantScreen';
  static const String homeMalikScreen = '/homeMalikScreen';
  static const String languageScreen = '/LanguageScreen';
  static const String signUpScreen = '/SignUpScreen';
  static const String signUpScreenOwner = '/SignUpScreenOwner';
  static const String test = '/test';
  static const String chatScreeen = '/chatScreeen';
  static const String chatList = '/chatListScreen';
  static const String servicesScreen = '/servicesScreen';
  static const String helpFirstStep = '/help_firstStepScreen';
  static const String inviteTeam = '/inviteTeamScreen';
  static const String contact = '/contactScreen';
  static const String unitDetailsScreen = '/UnitDetailsScreen';
  static const String allUnitsScreeen = '/AllUnitsScreeen';
  static const String profileScreen = '/ProfileScreen';
  static const String homeViewDetiles = '/HomeViewDetiles';
  static const String visaPaymentScreen = '/AddNewVisaPaymentScreen';
  static const String qrView = '/QrView';
  static const String updateProfile = '/updateProfile';
  static const String newFormScreen = '/NewFormScreen';
  static const String editeProfile = '/EditeProfileScreen';
  static const String favouritesScreen = '/FavouritesScreen';
  static const String contractsScreen = '/ContractsScreen';
  static const String myLicenceKeyProfileOwner = '/myLicenceKeyProfileOwner';
  static const String licenceServices = '/LicenceServices';
  static const String qrCode = '/qrCode';
  static const String my_security = '/my_security';
  static const String signIn = '/signIn';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),

  ];
}
