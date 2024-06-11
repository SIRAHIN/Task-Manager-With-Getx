import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/auth%20screens/controller/auth_controller.dart';
import 'package:task_manager/style/style.dart';

class EmailVerificationScreen extends StatelessWidget {
   EmailVerificationScreen({super.key});

  final authcontroller = Get.find<AuthController>();


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
                  "Your Email Address",
                  style: Head1Text(colorDarkBlue),
                ),

                const SizedBox(height: 3,),

                Text(
                  " A 6 digit verification pin will send to your\n email address",
                  style: Head7Text(colorLightGray),
                ),

                const SizedBox(height: 15,),
                TextFormField(
                  onChanged: (value) {
                    authcontroller.forEmailVerificationForm('email', value);
                  },
                  decoration: AppInputDecoration(label:  "Email"),
                ),
             
                const SizedBox(height: 15,),
                Obx(
                () => 
                   ElevatedButton(
                    style: AppButtonStyle(),
                    onPressed: () {
                      if(authcontroller.emailVerificationformData['email'].isEmpty){
                        ErrorToast("Email is Empty");
                      } else {
                        authcontroller.emailVerificationRequest();
                      }
                    },
                    child:  authcontroller.isLoading.value == true ? const Center(child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: colorGreen,
                      )) : SuccessButtonChild(
                          ButtonText: "Login", textColor: Colors.white),
                  ),
                ),

                const SizedBox(
                 height: 50,
                ),
  
                Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("Have account?", style: Head6Text(colorDarkBlue),),

                 InkWell(
                 onTap: () {
                 },
                   child: Text(" Sign In", style: Head7Text(colorGreen),
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