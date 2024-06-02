import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/screens/auth%20screens/model/user_model_data.dart';

class StoredData {

static Future<void> writeUserData (UserModelData userdata) async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', userdata.token!);
  await prefs.setString('email', userdata.data!.email!);
  await prefs.setString('firstName', userdata.data!.firstName!);
  await prefs.setString('lastName',userdata.data!.lastName!);
  await prefs.setString('mobile', userdata.data!.mobile!);
  await prefs.setString('photo', userdata.data!.photo!);
}

static Future<void> writeEmailVerification ({required email}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', email);
}

static Future<void> writeOTPVerification (otp) async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', otp);
}


static Future<String?> readUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata= prefs.getString(Key);
  return mydata;
}




}