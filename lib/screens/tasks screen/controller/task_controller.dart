import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_manager/screens/tasks%20screen/components/cancel_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/completed_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/new_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/progress_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/model/task_model.dart';
import 'package:task_manager/services/api_helper.dart';


class TaskController extends GetxController {
  

var isLoading = false.obs;

TaskModel? taskModelData;

// @override
//   void onInit() async {
//     await fetchTaskbyStatus('New');
//     super.onInit();
//   }


// ----- btmNavIndex ----- //
  var bottomNavIndex = 0.obs;
  changeBtmNavIndex(int index)  async{
    bottomNavIndex.value = index;
    switch (bottomNavIndex.value) {
      case 0:
       fetchTaskbyStatus('New');
      break;
      case 1:
       fetchTaskbyStatus('Progress');
      break;
      case 2:
       fetchTaskbyStatus("Completed");
      break;
      case 3:
       fetchTaskbyStatus("Canceled");
      break;
      default:
      break;
    }
    update();
  }

  List widgetClassList =  [
    NewTaskList(),
    ProgressTaskList(),
    CompletedTaskList(),
    CancelTaskList()
  ];

  Future<TaskModel?> fetchTaskbyStatus(taskbyStatus) async {
    print(taskbyStatus);
    isLoading.value = true;
    var responseData = await ApiHelper.getTaskbyStatus(status: taskbyStatus);
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
}
