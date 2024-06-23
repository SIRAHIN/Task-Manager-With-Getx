import 'dart:convert';
import 'package:get/get.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/screens/tasks%20screen/components/cancel_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/completed_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/new_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/progress_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/model/task_model.dart';
import 'package:task_manager/services/api_helper.dart';
import 'package:task_manager/utils/utility.dart';


class TaskController extends GetxController {
  

var isLoading = false.obs;
TaskModel? taskModelData;


// radioBtn state value //

var statusValue = 'New'.obs;


//inital call for body and app bar data//
@override
  void onInit() async {
    await changeBtmNavIndex(bottomNavIndex.value);
    await ReadAppBarData();
    super.onInit();
  }


  // -- User Data Information Handling -- //
  Map<String,String> ProfileData={"email":"","firstName":"","lastName":"","photo": StoredData.DefaultProfilePic}.obs;
  
  Future ReadAppBarData() async {
  String? email= await StoredData.readUserData('email');
  String? firstName= await StoredData.readUserData('firstName');
  String? lastName= await StoredData.readUserData('lastName');
  String? photo= await StoredData.readUserData('photo');
   ProfileData.update('firstName', (value) => firstName!);
   ProfileData.update('lastName', (value) => lastName!);
   ProfileData.update('email', (value) => email!);
  //ProfileData.update('photo', (value) => photo ?? StoredData.DefaultProfilePic);
  update();
  }




// ----- btmNavIndex ----- //
  var bottomNavIndex = 0.obs;
  changeBtmNavIndex(int index)  async{
    bottomNavIndex.value = index;
    switch (bottomNavIndex.value) {
      case 0:
      await fetchTaskbyStatus('New');
      statusValue.value = 'New';
      break;
      case 1:
      await fetchTaskbyStatus('Progress');
      statusValue.value = 'Progress';
      break;
      case 2:
      await fetchTaskbyStatus("Completed");
      statusValue.value = 'Completed';
      break;
      case 3:
      await fetchTaskbyStatus("Canceled");
      statusValue.value = 'Canceled';
      break;
      default:
      break;
    }
    update();
  }

  // list of fragments //
  List widgetClassList =  [
    const NewTaskList(),
    const ProgressTaskList(),
    const CompletedTaskList(),
    const CancelTaskList()
  ];

  // Api calling for different fragments //
  Future<TaskModel?> fetchTaskbyStatus(taskbyStatus) async {
    print(taskbyStatus);
    isLoading.value = true;
    var responseData = await ApiHelper.getTaskbyStatus(status: taskbyStatus);
    print(responseData);
    var ResultBody = json.decode(responseData);
    if (ResultBody['status'] == "success") {
    taskModelData = TaskModel.fromJson(ResultBody);
    isLoading.value = false;  
    update();
    return taskModelData;
    } else {
    return null;
    }
  }

  // -- Created New Task -- //
  Map<String , String> formValue = {
    "title":"",
    "description":"",
    "status":"New"
  }.obs;
  setFormValue (mapKay, String mapValue){
    formValue.update(mapKay, (value) => mapValue);
    update();
  }
  Future createTaskRequest () async{
    isLoading.value = true;
    var success = await ApiHelper.createNewTaskRequest(formValue);
    isLoading.value = false;
    if (success) { 
    Get.back();
     await changeBtmNavIndex(bottomNavIndex.value);
    } else {
      Get.offAllNamed(RoutesName.homeScreen);
    }
  }


  // delete requet here //
  requestForDeleteTask (taskId) async {
    bool isDeleted = await ApiHelper.taskDeleteRequest(id: taskId);
    if(isDeleted){
      Get.back();
      await changeBtmNavIndex(bottomNavIndex.value);
    } else {
      Get.offAllNamed(RoutesName.homeScreen);
    }
  }

   // delete requet here //
  requestForUpdateStatusTask (taskId, status) async {
    bool isUpdated = await ApiHelper.taskUpdateRequest(taskId, status);
    if(isUpdated){
      Get.back();
      await changeBtmNavIndex(bottomNavIndex.value);
    } else {
      Get.offAllNamed(RoutesName.homeScreen);
    }
  }





}
