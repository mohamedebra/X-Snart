import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_watch/controller/auth_controller.dart';
import 'package:smart_watch/core/helper/route_helper.dart';
import 'package:smart_watch/features/profile_screen/screen/about_screen.dart';
import 'package:smart_watch/features/profile_screen/screen/feedback_screen.dart';
import 'package:smart_watch/features/splash/splash_screen.dart';

import '../../core/PreferenceUtils.dart';
import '../../core/constants/styles.dart';
import '../auth/login_screen.dart';
import '../home_screen/home_view.dart';
import 'screen/user_profile.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final controller = Get.find<AuthController>();
  isBool()async{
    controller.isLogin=  await PreferenceUtils.isLogin();
    controller.emailUser=  await PreferenceUtils.getEmailUser();
    print('isLogin ${controller.isLogin}');
  }

  @override
  void initState() {
    isBool();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Yalla Go',style: robotoMedium.copyWith(color: Colors.white,fontSize: 20),),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            color: Colors.teal,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yalla Go",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "ID: ${controller.emailUser ?? 'N/A'}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Statistics Row
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(Icons.directions_walk, "0", "Steps", Colors.blue),
                _buildStatItem(Icons.location_on, "0.0", "km", Colors.amber),
                _buildStatItem(Icons.directions_run, "0", "Steps", Colors.red),
              ],
            ),
          ),

          // Options Section
          Expanded(
            child: ListView(
              children: [
                _buildListItem(Icons.person, "User Profile", Colors.blue,(){
                  Get.to(UserProfileScreen());
                }),
                _buildListItem(Icons.info, "About", Colors.teal,(){
                  Get.to(AboutScreen());

                }),
                _buildListItem(Icons.feedback, "Feedback", Colors.green,(){
                  Get.to(FeedbackScreen());

                }),
                controller.isLogin! ?  _buildListItem(Icons.logout, "logout", Colors.red,()async{
                  controller.logout();
                }) : SizedBox(),
              ],
            ),
          ),

          // Login Button
          controller.isLogin! ?   SizedBox() :  Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add Login Action
                Get.toNamed(RouteHelper.signIn);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }

  Widget _buildStatItem(IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 30),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper method for list items
  Widget _buildListItem(IconData icon, String label, Color color,Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}

