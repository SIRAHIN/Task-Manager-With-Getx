import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';
import 'package:task_manager/services/api_helper.dart';


class ProfileUpdateController extends GetxController {

File? image;
String? imagePath;
RxBool isLoading = false.obs;

final taskController = Get.find<TaskController>();




Future pickImageCamera() async {
try {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image == null) return;
  final imageTemp = File(image.path);
  this.image = imageTemp;
 }on PlatformException catch (e) {
  print('Failed to pick image: $e');
}
update();
}

  convertImgtoBase64 (){
   List<int> bytes = File(image!.path).readAsBytesSync();
   imagePath = base64Encode(bytes);
   forUpdateProfileForm('photo', imagePath!);
     
  }


  Map profileUpdateformData = {
    'email': '',
    'firstName': '',
    'lastName': '',
    'mobile' : '',
    'password': '',
    'photo' : ''
  }.obs;

  forUpdateProfileForm (mapKey, String mapValue) {
    profileUpdateformData.update(mapKey, (value) => mapValue,);
  }

  Future profileUpdateRequest () async{
    isLoading.value = true;
    convertImgtoBase64();
    var success = await ApiHelper.updateProfileRequest(profileUpdateformData);
    isLoading.value = false;
    if (success) {
      taskController.ReadAppBarData();
      Get.back();
      taskController.changeBtmNavIndex(taskController.bottomNavIndex.value);
    } else {
    Get.offAllNamed(RoutesName.updateProfileScreen);
    }
  }
}