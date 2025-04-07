import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../controller/LocalizationController.dart';
import '../../controller/auth_controller.dart';
import '../../controller/profile_controller.dart';


Future<void> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Repository

  // Controller
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => UserProfileController());

  // Retrieving localized data
}
