import 'package:cocktelia/home/home_screen.dart';
import 'package:cocktelia/splash/splash_title.dart';
import 'package:cocktelia/splash/splash_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
        var seconds = const Duration(seconds: 4);
    Future.delayed(seconds, (){
      Navigator.pushAndRemoveUntil(
        context, MyHomePage.route, 
        (route) => false);
  },);
    return Scaffold(
      body: Stack(
        children: [
          const SplashImage(),
          Positioned(
            top: 56.sp,
            left: 0,
            right: 0,
            child: const SplashTitle(),
          ),
        ],
      ),
    );
  }
}
