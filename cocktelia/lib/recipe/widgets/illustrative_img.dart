
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IllustrativeIMG extends StatelessWidget{
  const IllustrativeIMG({super.key, required this.drinkImage});

  final String drinkImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
        image: NetworkImage(drinkImage),
        fit: BoxFit.cover,
        ),
      ),
      width: double.infinity.sp,
      height: 270.sp,
    );
  }
}