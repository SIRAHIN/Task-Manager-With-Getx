import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/auth%20screens/controller/auth_controller.dart';
import 'package:task_manager/style/style.dart';

class SetPasswordScreen extends StatelessWidget {
   SetPasswordScreen({super.key});

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
                  "Set Password",
                  style: Head1Text(colorDarkBlue),
                ),

                const SizedBox(height: 3,),

                Text(
                  " A 6 digit verification pin will send to your\n email address",
                  style: Head7Text(colorLightGray),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  onChanged: (value) {
                    authController.forRecoveryPasswordForm('password', value);
                  },
                  decoration: AppInputDecoration(hText:  "Password"),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                onChanged: (value) {
                   authController.forRecoveryPasswordForm('cPassword', value);
                },
                  decoration: AppInputDecoration(label:  "Confirm Password"),
                ),
                const SizedBox(height: 15,),
                ElevatedButton(
                  style: AppButtonStyle(),
                  onPressed: () {
                    if(authController.setPasswordForm['password'].isEmpty || authController.setPasswordForm['cPassword'].isEmpty){
                     ErrorToast("Password is Empty");
                    } else if (authController.setPasswordForm['password'] != authController.setPasswordForm['cPassword']) {
                        ErrorToast("New password is not match");
                    } else {
                       authController.reSetPasswordRequest();
                    }
                   
                  },
                  child: SuccessButtonChild(
                      ButtonText: "Login", textColor: Colors.white),
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