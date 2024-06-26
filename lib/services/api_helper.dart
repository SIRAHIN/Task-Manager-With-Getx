import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_manager/screens/auth%20screens/model/user_model_data.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utils/constants/api_constants.dart';
import 'package:task_manager/utils/utility.dart';

class ApiHelper {

  // ----- Login ----- //
  static Future<bool> LoginRequest(FormValues) async {
    var URL = Uri.parse("${ApiServices.baseUrl}/login");
    var PostBody = json.encode(FormValues);
    var response = await http.post(URL,
        headers: ApiServices.requestHeader, body: PostBody);
    var ResultCode = response.statusCode;
    var ResultBody = json.decode(response.body);
    UserModelData userModelData = UserModelData.fromJson(ResultBody);
    if (ResultCode == 200 && userModelData.status == "success") {
      SuccessToast("Request Success");
      await StoredData.writeUserData(userModelData);
      return true;
    } else {
      ErrorToast("Request fail ! try again");
      return false;
    }
  }

  // ----- Registration ----- //
  static Future<bool> RegistrationRequest(FormValues) async{
  var URL=Uri.parse("${ApiServices.baseUrl}/registration");
  var PostBody=json.encode(FormValues);
  var response= await  http.post(URL,headers:ApiServices.requestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

// ----- Verifying Email ----- //
static Future<bool> verifyEmailRequest(Email) async{
  var URL=Uri.parse("${ApiServices.baseUrl}/RecoverVerifyEmail/$Email");
  var response= await http.get(URL,headers:ApiServices.requestHeader);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    await StoredData.writeEmailVerification(email: Email);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

// ----- Verifying OTP Request  ----- //
static Future<bool> VerifyOTPRequest({required Email,required OTP}) async{
  var URL=Uri.parse("${ApiServices.baseUrl}/RecoverVerifyOTP/$Email/$OTP");
  var response= await  http.get(URL,headers:ApiServices.requestHeader);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
     await StoredData.writeOTPVerification(OTP);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}

// ----- Reset Password ----- //
static Future<bool> SetPasswordRequest(FormValues) async{
  var URL=Uri.parse("${ApiServices.baseUrl}/RecoverResetPass");
  var PostBody=json.encode(FormValues);
  var response= await  http.post(URL,headers:ApiServices.requestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}


// // ----- Get task by Status ----- // //
static Future<String> getTaskbyStatus ({required String status}) async {
  String? token = await StoredData.readUserData('token');
  Map<String, String>? requestHeaderWithToken={"Content-Type":"application/json",'token':token!};
  var URL=Uri.parse("${ApiServices.baseUrl}/listTaskByStatus/$status");
  var response= await  http.get(URL,headers:requestHeaderWithToken);
  var ResultCode =response.statusCode;
   if(ResultCode==200){
    SuccessToast("Request Success");
    return response.body;
  }
  else{
    ErrorToast("Request fail ! try again");
    return '';
  }

}


// create new Task //
static Future<bool> createNewTaskRequest(FormValues) async{
  String? token = await StoredData.readUserData('token');
  Map<String, String>? requestHeaderWithToken={"Content-Type":"application/json",'token':token!};
  var URL=Uri.parse("${ApiServices.baseUrl}/createTask");
  var PostBody=json.encode(FormValues);
  var response= await  http.post(URL,headers:requestHeaderWithToken,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Create Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}



// // ----- Delete Task Request ----- // //
static Future<bool> taskDeleteRequest ({id}) async {
  String? token = await StoredData.readUserData('token');
  Map<String, String>? requestHeaderWithToken={"Content-Type":"application/json",'token':token!};
  var URL=Uri.parse("${ApiServices.baseUrl}/deleteTask/$id");
  var response= await  http.get(URL,headers:requestHeaderWithToken);
  var ResultCode =response.statusCode;
   if(ResultCode==200){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }

}


// Update Task Request //
static Future<bool> taskUpdateRequest(id,status) async {
  var URL=Uri.parse("${ApiServices.baseUrl}/updateTaskStatus/$id/$status");
  String? token= await StoredData.readUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var response= await http.get(URL,headers:RequestHeaderWithToken);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}


//
static Future taskStatusCount() async {
  var url = Uri.parse('${ApiServices.baseUrl}/taskStatusCount');
  String? token= await StoredData.readUserData("token");
  var RequestHeaderWithToken={"Content-Type":"application/json","token":'$token'};
  var response= await http.get(url,headers:RequestHeaderWithToken);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
   // SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail ! try again");
    return null;
  }
}


static Future updateProfileRequest(postedData) async {
  String? token = await StoredData.readUserData('token');
  Map<String, String>? requestHeaderWithToken={"Content-Type":"application/json",'token':token!};
  var URL=Uri.parse("${ApiServices.baseUrl}/profileUpdate");
  var PostBody=json.encode(postedData);
  var response= await http.post(URL,headers:requestHeaderWithToken, body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success"){
    await StoredData.writeUserporfileUpdateData(postedData);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}






}
