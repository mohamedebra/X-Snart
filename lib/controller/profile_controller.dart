import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var avatar = ''.obs;
  var nickname = 'Please enter a nickname'.obs;
  var sex = 'Male'.obs;
  var age = '25'.obs;
  var height = '170 cm'.obs;
  var weight = '65 kg'.obs;
  var targetStep = '5000 Step'.obs;
  var weightUnit = 'kg'.obs;
  var heightUnit = 'cm'.obs;
}