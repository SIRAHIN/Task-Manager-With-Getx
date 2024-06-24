import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/profile%20screen/controller/profile_update_controller.dart';
import 'package:task_manager/style/style.dart';

class UpdateProfileScreen extends StatelessWidget {
 UpdateProfileScreen ({super.key});

 final _formKey = GlobalKey<FormState>();
 final controllerProfile = Get.find<ProfileUpdateController>();

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
                      "Update Profile",
                      style: Head1Text(colorDarkBlue),
                    ),
                    
                    const SizedBox(height: 20,),

                    Row(
                    children: [

                     InkWell(
                     onTap: () async {
                      await controllerProfile.pickImageCamera();
                     },
                       child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: colorGreen,
                          borderRadius:  BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
                        ),
                        child: Text('Photos', style: Head6Text(Colors.white),),
                       ),
                     ),

                    
                        Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: screenHeight*.32,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GetBuilder<ProfileUpdateController>(
                          builder: (controller) => 
                           controller.image == null ?  const Text('No Image selectd') : Text(controller.image.toString(), style: Head6Text(Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis,)),
                        ),
                       ),
                     


                    ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        controllerProfile.forUpdateProfileForm('email', value);
                      },
                      decoration: AppInputDecoration(label:  "Email"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        controllerProfile.forUpdateProfileForm('firstName', value);
                      },
                      decoration: AppInputDecoration(label:  "First Name"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        controllerProfile.forUpdateProfileForm('lastName', value);
                      },
                      decoration: AppInputDecoration(label:  "Last Name"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        controllerProfile.forUpdateProfileForm('mobile', value);
                      },
                      decoration: AppInputDecoration(hText:  "Mobile"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        controllerProfile.forUpdateProfileForm('password', value);
                      },
                      decoration: AppInputDecoration(label:  "Password"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                         validator: (value) {
                          if (value == null || value.isEmpty) {
                           return "confirm password Empty" ; //  ErrorToast("Confirm Password Empty");
                          }  else if (value != controllerProfile.profileUpdateformData["password"]) { 
                            return "Password not Matched" ;   // ErrorToast("Password not Matched!");
                            }
                          return null;
                           
                        },
                      // onChanged: (value) {
                       
                      // },
                      decoration: AppInputDecoration(label:  "Confirm Password"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                    () => 
                       ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {
                          if (controllerProfile
                              .profileUpdateformData['email'].isEmpty) {
                            ErrorToast("Email is Empty");
                          } else if (controllerProfile
                              .profileUpdateformData['firstName'].isEmpty) {
                            ErrorToast("First Name is Empty");
                          } else if (controllerProfile
                              .profileUpdateformData['lastName'].isEmpty) {
                            ErrorToast("Last Name is Empty");
                          } else if (controllerProfile
                              .profileUpdateformData['mobile'].isEmpty) {
                            ErrorToast("Mobile is Empty");
                          } else if (controllerProfile
                              .profileUpdateformData['password'].isEmpty) {
                            ErrorToast("Paaword is Empty");
                          } else {
                            if(_formKey.currentState!.validate()){
                              controllerProfile.profileUpdateRequest();
                            } else {
                              Get.snackbar("Registration Error", "Account was not created");
                            }
                             
                            
                            
                          }
                        },
                        child: controllerProfile.isLoading.value == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                                backgroundColor: colorGreen,
                              ))
                            : SuccessButtonChild(
                                ButtonText: "Update Profile", textColor: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                 
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
