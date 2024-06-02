import 'package:get/get.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/services/api_helper.dart';
import 'package:task_manager/utils/utility.dart';


class AuthController extends GetxController {




//  var verifyingEmail =  ''.obs;
//  late var verifyingOtp = ''.obs;    

 var isLoading = false.obs;

  // Future<void> setVerifingEmailAndOtp () async {
  //  verifyingEmail.value = (await StoredData.readUserData("EmailVerification"))!;
  //  verifyingOtp.value = (await StoredData.readUserData("OTPVerification"))!;  
  //  update();
  // }



// -------------------- Login activities -------------------- //
  Map loginformData = {
    'email': '',
    'password': '',
  }.obs;

  forloginForm (mapKey, String mapValue) {
    loginformData.update(mapKey, (value) => mapValue,);
  }

  Future loginRequest () async{
    isLoading.value = true;
    var success = await ApiHelper.LoginRequest(loginformData);
    isLoading.value = false;
    if (success) {
      Get.offAllNamed(RoutesName.homeScreen);
    } else {
      Get.offAllNamed(RoutesName.loginScreen);
    }
  }

  // -------------------- Registration activities -------------------- //
  Map registrationformData = {
    'email': '',
    'firstName': '',
    'lastName': '',
    'mobile' : '',
    'password': '',
    'photo' : ''
  }.obs;

  forRegistrationForm (mapKey, String mapValue) {
    registrationformData.update(mapKey, (value) => mapValue,);
  }

  Future registationRequest () async{
    isLoading.value = true;
    var success = await ApiHelper.RegistrationRequest(registrationformData);
    isLoading.value = false;
    if (success) {
      Get.offAllNamed(RoutesName.loginScreen);
    } else {
       Get.offAllNamed(RoutesName.registrationScreen);
    }
  }


    // -------------------- Email Verification activities -------------------- //
  Map emailVerificationformData = {
    'email': '',
  }.obs;

  forEmailVerificationForm (mapKey, String mapValue) {
    emailVerificationformData.update(mapKey, (value) => mapValue,);
  }

  Future emailVerificationRequest () async{
    isLoading.value = true;
    var success = await ApiHelper.verifyEmailRequest(emailVerificationformData["email"]);
    isLoading.value = false;
    if (success) {
      Get.toNamed(RoutesName.pinVerificationScreen);
    } else {
      Get.toNamed(RoutesName.emailVerificationScreen);
    }
  }

    // -------------------- OTP Pin Verification activities -------------------- //

   Map pinVerificationformData = {
    'otp' : ''
   }.obs;

   forPinVeficationform (mapKey , String mapValue) {
    pinVerificationformData.update(mapKey, (value) => mapValue);
   }

   Future pinVerificationRequest () async{
    isLoading.value = true;
    // await setVerifingEmailAndOtp();
    var success = await ApiHelper.VerifyOTPRequest(Email: await StoredData.readUserData('EmailVerification'), OTP: pinVerificationformData['otp']);
    isLoading.value = false;
    if (success) {
      Get.toNamed(RoutesName.setPasswordScreen);
    } else {
      Get.toNamed(RoutesName.pinVerificationScreen);
    }
  }

  // -------------------- Set Password Verification activities -------------------- //

    Map setPasswordForm = {
    "email": '',
    "OTP":'',
    "password":'',
    'cPassword' : ''
   }.obs;

   forRecoveryPasswordForm (mapKey , String mapValue) {
    setPasswordForm.update(mapKey, (value) => mapValue);
   }

  callStoredData () async{
    forRecoveryPasswordForm('OTP', (await StoredData.readUserData('OTPVerification'))!);
    forRecoveryPasswordForm('email', (await StoredData.readUserData('EmailVerification'))!);
  }

   Future reSetPasswordRequest () async{
    await callStoredData();
    isLoading.value = true;
    var success = await ApiHelper.SetPasswordRequest(setPasswordForm);
    isLoading.value = false;
    if (success) {
      Get.offAllNamed(RoutesName.loginScreen);
    } else {
      Get.toNamed(RoutesName.pinVerificationScreen);
    }
  }



  

  

}