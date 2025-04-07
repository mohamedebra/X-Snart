import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_watch/features/home_screen/home_details_screen.dart';
import 'package:smart_watch/features/home_screen/home_screen.dart';
import 'package:smart_watch/features/profile_screen/profile_screen.dart';

import '../../core/functions/alertexitapp.dart';
import '../set_screen/set_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  static List<Widget> _widgetOption = [
    HomeScreen(),
     // SetScreen(),
    const ProfileScreen(),

  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => alertExitApp(context),

      child: Scaffold(
        body: Center(
          child: _widgetOption.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          selectedItemColor:   Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 27.w,
                ),
                label: 'Home'.tr),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       CupertinoIcons.shuffle_thick,
            //       size: 27.w,
            //     ),
            //     label: 'Set'.tr),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.profile_circled,
                  size: 19.w,
                ),
                label: 'Profile'.tr),
          ],
        ),
      ),
    );
  }
}
