import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utils/constants/asset_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Positioned(
            child: Image.asset(
            splashImgPath,
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            ),
          ),
          
        ],
      ),
    );
  }
}