import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/screens/auth%20screens/controller/auth_controller.dart';
import 'package:task_manager/style/style.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Started With",
                  style: Head1Text(colorDarkBlue),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  onChanged: (value) {
                    authController.forloginForm('email', value);
                  },
                  decoration: AppInputDecoration("Email"),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                onChanged: (value) {
                  authController.forloginForm('password', value);
                },
                  decoration: AppInputDecoration("Password"),
                ),
                const SizedBox(height: 15,),

                Obx(
                () => 
                   ElevatedButton(
                    style: AppButtonStyle(),
                    onPressed: () {
                     if(authController.loginformData['email'].isEmpty){
                        ErrorToast("Email is empty");
                     } else if(authController.loginformData["password"].isEmpty){
                      ErrorToast("Password is empty");
                     } else{
                      authController.loginRequest();
                     }
                    },
                    child: authController.isLoading.value == true ? const Center(child: CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: colorGreen,
                    )) : SuccessButtonChild(
                        ButtonText: "Login", textColor: Colors.white),
                  ),
                ),

                const SizedBox(
                 height: 50,
                ),

                Center(
                  child: TextButton(
                  onPressed: () {
                    Get.toNamed(RoutesName.emailVerificationScreen);
                  }, child: Text("Forget Password?", style: Head7Text(colorLightGray),
                  ),
                  ),
                ),
  
                Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("Dont have account?", style: Head6Text(colorDarkBlue),),

                 InkWell(
                 onTap: () {
                  Get.toNamed(RoutesName.registrationScreen);
                 },
                   child: Text(" Sign up", style: Head7Text(colorGreen),
                   ),
                 ),
                ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
