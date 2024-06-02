import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';


class NewTaskList extends StatelessWidget {
   NewTaskList({super.key});

  //final taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // body: Obx(() {
      //   if(taskController.isLoading.value == true){
      //    return const Center(child: CircularProgressIndicator());
      //   } else {
      //     return ListView.builder(
      //     itemCount: taskController.taskModelData!.data!.length,
      //     itemBuilder: (context, index) {
      //       var listData = taskController.taskModelData!.data![index];
      //       return ListTile(
      //         title: Text(listData.title.toString()),
      //       );
      //     },
      //     );
      //   }
      // },),
    );
  }
}