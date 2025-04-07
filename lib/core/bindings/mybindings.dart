
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/auth_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/profile_controller.dart';
import '../../controller/set_controller.dart';
import '../api_client.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.putAsync<SharedPreferences>(() async => await SharedPreferences.getInstance(), permanent: true);

    Get.lazyPut(() => ApiClient(sharedPreferences: Get.find()), fenix: true);
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
    // Get.lazyPut(() => ScanController());
    Get.put(UserProfileController(), permanent: true);

    //  Repository


    // Get.lazyPut<AuthRepository>(() => AuthRepository(apiClient: Get.find()));
    // Get.lazyPut<OwnerRepository>(() => OwnerRepository(apiClient: Get.find()));
    // Get.lazyPut<HomeRepository>(() => HomeRepository(apiClient: Get.find()));
    // Get.lazyPut<ChatRepository>(() => ChatRepository(apiClient: Get.find()));
    // Get.lazyPut<ContractsRepository>(() => ContractsRepository(apiClient: Get.find()));
    // Get.lazyPut<ExpensesRepository>(() => ExpensesRepository(apiClient: Get.find()));

  }
}
