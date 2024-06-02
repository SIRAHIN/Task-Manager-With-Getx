import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/auth%20screens/controller/auth_controller.dart';
import 'package:task_manager/style/style.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

 final _formKey = GlobalKey<FormState>();
 final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              ScreenBackground(context),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * .1,
                    ),
                    Text(
                      "Join With Us",
                      style: Head1Text(colorDarkBlue),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        authController.forRegistrationForm('email', value);
                      },
                      decoration: AppInputDecoration("Email"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        authController.forRegistrationForm('firstName', value);
                      },
                      decoration: AppInputDecoration("First Name"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        authController.forRegistrationForm('lastName', value);
                      },
                      decoration: AppInputDecoration("Last Name"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        authController.forRegistrationForm('mobile', value);
                      },
                      decoration: AppInputDecoration("Mobile"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        authController.forRegistrationForm('password', value);
                      },
                      decoration: AppInputDecoration("Password"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                           return "confirm password Empty" ; //  ErrorToast("Confirm Password Empty");
                          }  else if (value != authController.registrationformData["password"]) { 
                            return "Password not Matched" ;   // ErrorToast("Password not Matched!");
                            }
                          return null;
                           
                        },
                      // onChanged: (value) {
                       
                      // },
                      decoration: AppInputDecoration("Confirm Password"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                    () => 
                       ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {
                          if (authController
                              .registrationformData['email'].isEmpty) {
                            ErrorToast("Email is Empty");
                          } else if (authController
                              .registrationformData['firstName'].isEmpty) {
                            ErrorToast("First Name is Empty");
                          } else if (authController
                              .registrationformData['lastName'].isEmpty) {
                            ErrorToast("Last Name is Empty");
                          } else if (authController
                              .registrationformData['mobile'].isEmpty) {
                            ErrorToast("Mobile is Empty");
                          } else if (authController
                              .registrationformData['password'].isEmpty) {
                            ErrorToast("Paaword is Empty");
                          } else {
                            if(_formKey.currentState!.validate()){
                              authController.registationRequest();
                            } else {
                              Get.snackbar("Registration Error", "Account was not created");
                            }
                             
                            
                            
                          }
                        },
                        child: authController.isLoading.value == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                                backgroundColor: colorGreen,
                              ))
                            : SuccessButtonChild(
                                ButtonText: "Login", textColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have account?",
                          style: Head6Text(colorDarkBlue),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            " Sign In",
                            style: Head7Text(colorGreen),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
