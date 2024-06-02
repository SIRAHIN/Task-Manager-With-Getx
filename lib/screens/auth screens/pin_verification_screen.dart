import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/screens/auth%20screens/controller/auth_controller.dart';
import 'package:task_manager/style/style.dart';

class PinVerificationScreen extends StatelessWidget {
   PinVerificationScreen({super.key});

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
                  "Pin Verification",
                  style: Head1Text(colorDarkBlue),
                ),

                const SizedBox(height: 3,),

                Text(
                  " A 6 digit verification pin will send to your\n email address",
                  style: Head7Text(colorLightGray),
                ),
                const SizedBox(height: 10,),

                PinCodeTextField(
                  onChanged: (value) {
                    authController.forPinVeficationform('otp', value);
                  },
                  length: 6,
                  appContext: context,
                  pinTheme: AppOTPStyle(),
                ),
              
                const SizedBox(height: 15,),
                ElevatedButton(
                  style: AppButtonStyle(),
                  onPressed: () {
                    if(authController.pinVerificationformData['otp'].isEmpty){
                      ErrorToast("Otp is Required");
                    } else if (authController.pinVerificationformData['otp'].length < 6){
                      ErrorToast("Missing otp number");
                    } else{
                       authController.pinVerificationRequest();
                    }
                   
                  },
                  child: SuccessButtonChild(
                      ButtonText: "Verify", textColor: Colors.white),
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