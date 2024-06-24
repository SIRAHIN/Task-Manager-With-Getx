import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utils/constants/asset_paths.dart';
import 'package:task_manager/utils/utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _checkLoginStatus();
    });
  }

  Future<void> _checkLoginStatus() async {
    String? token = await StoredData.readUserData("token");
    if (token == null) {
      Get.offNamed(RoutesName.loginScreen);
    } else {
      Get.offNamed(RoutesName.homeScreen);
    }
  }
  


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