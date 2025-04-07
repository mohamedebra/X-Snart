import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_watch/features/home_screen/home_view.dart';


import '../../core/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // _route();

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          backgroundColor: Colors.white,
          splashIconSize: 250,
          duration: 3000,
          animationDuration: const Duration(seconds: 1),
          splash: Image.asset(Images.logo),
          nextScreen: const HomeView()),
    );
  }
}
