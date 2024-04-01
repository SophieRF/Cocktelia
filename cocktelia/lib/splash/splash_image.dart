import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget{
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/OIG2.NoyM0JZu50IYU.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
  }

}