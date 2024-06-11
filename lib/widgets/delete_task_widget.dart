import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';
import 'package:task_manager/style/style.dart';

import '../screens/tasks screen/model/task_model.dart';

class DeleteTaskWidget extends StatelessWidget {
  const DeleteTaskWidget({
    super.key,
    required this.taskController,
    required this.listData,
  });

  final TaskController taskController;
  final Data listData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: colorRed,
        onPressed: () {
          Get.defaultDialog(
              middleText: 'Are you sure?',
              title: 'Delete Alart!',
              textConfirm: "Yes",
              onConfirm: () => taskController.requestForDeleteTask(listData.sId),
              buttonColor: colorDarkBlue,
              onCancel: () => Get.back(),
              confirmTextColor:
              Colors.amberAccent,
              barrierDismissible: false,
              textCancel: 'No',
              middleTextStyle:TextStyle(
              fontSize: 15,
              )
              );
        },
        icon: const Icon(Icons.delete));
  }
}