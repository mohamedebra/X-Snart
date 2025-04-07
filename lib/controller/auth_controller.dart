import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_watch/features/splash/splash_screen.dart';

import '../core/PreferenceUtils.dart';
import '../features/home_screen/home_view.dart';

class AuthController extends GetxController{
   TextEditingController phoneController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController firstNameController = TextEditingController();
   TextEditingController lastNameController = TextEditingController();
   TextEditingController phoneSignUpController = TextEditingController();
   TextEditingController passwordSignUpController = TextEditingController();
   final FirebaseAuth _auth = FirebaseAuth.instance;
   String? countryDialCode;
  bool _isLoading = false;
  bool _showPassView = false;
  bool _isActiveRememberMe = false;
   bool isLogin = false;
   String? emailUser;

  bool get isActiveRememberMe => _isActiveRememberMe;
  bool get isLoading => _isLoading;
  bool get showPassView => _showPassView;
   @override
   void onInit()  {
     countryDialCode = CountryCode.fromCountryCode('EG').dialCode;
     super.onInit();
   }

   isBool() async {
     isLogin = await PreferenceUtils.isLogin();
     emailUser = await PreferenceUtils.getEmailUser();
     print('isLogin ${Get.find<AuthController>().isLogin}');
     update();
   }


  void showHidePass({bool isUpdate = true}){
    _showPassView = ! _showPassView;
    if(isUpdate) {
      update();
    }
  }
  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }

   String formatPhoneNumber(String phoneNumber) {
     if (!phoneNumber.startsWith('+')) {
       return '+2' + phoneNumber.replaceFirst(RegExp(r'^0+'), '');
     }
     return phoneNumber;
   }


   void logout()async{
     await FirebaseAuth.instance.signOut();
     isLogin =  await PreferenceUtils.setLogin(false);
     await PreferenceUtils.clearAllPreferences();
     isLogin = false;
     await Future.delayed(Duration(seconds: 1));
     Get.offAll(SplashScreen());
     update();
   }

   void register() async {
     if (phoneSignUpController.text.isEmpty || passwordSignUpController.text.isEmpty) {
       Get.snackbar('Error', 'Please fill all fields', backgroundColor: Colors.red, colorText: Colors.white);
       return;
     }

     _isLoading = true;

     try {
       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
         email: phoneSignUpController.text.trim() ,
         password: passwordSignUpController.text.trim(),
       );

       String? userId = userCredential.user?.uid;
       String? email = FirebaseAuth.instance.currentUser?.email;

       if (userId != null) {
         print("User ID: $userId");
         print("User email: $email");
         isLogin = await PreferenceUtils.setLogin(true);
         await PreferenceUtils.setId(userId);
         await PreferenceUtils.setEmailUser(email!);
         emailUser =  PreferenceUtils.getEmailUser();

         Get.snackbar('Success', 'User registered successfully!',
             backgroundColor: Colors.green, colorText: Colors.white);
         Get.offAll(HomeView());
       }
     } catch (e) {
       Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
     }

     _isLoading = false;
     update();

   }


   void login() async {
     if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
       print("Error: Missing email or password");
       Get.snackbar('Error', 'Please enter phone and password', backgroundColor: Colors.red, colorText: Colors.white);
       return;
     }

     _isLoading = true;
     print("Attempting login with: ${phoneController.text.trim()}");

     try {
       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
         email: phoneController.text.trim() ,
         password: passwordController.text.trim(),
       );

       String? userId = userCredential.user?.uid;
       String? email = FirebaseAuth.instance.currentUser?.email;

       if (userId != null) {
         print("User ID: $userId");
         print("User Email: $email");

         isLogin = await PreferenceUtils.setLogin(true);
         await PreferenceUtils.setId(userId);
         await PreferenceUtils.setEmailUser(email ?? "No Email");
         emailUser =  PreferenceUtils.getEmailUser();

         Get.snackbar('Success', 'Logged in successfully!',
             backgroundColor: Colors.green, colorText: Colors.white);
         Get.offAll(HomeView());
       } else {
         print("Error: userId is null");
       }
     } catch (e) {
       print("Error during login: $e");
       Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.white);
     }

     _isLoading = false;
     update();

   }

}



