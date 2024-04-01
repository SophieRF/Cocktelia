import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButton extends StatelessWidget{
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 32.sp,
        left: 16.sp,
        child: IconButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          iconSize: 26.sp,
        ),
      );
  }
}