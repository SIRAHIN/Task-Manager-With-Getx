import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';
import 'package:task_manager/style/style.dart';

import '../screens/tasks screen/model/task_model.dart';

class CustomStatusBottomSheet extends StatelessWidget {
  CustomStatusBottomSheet(
      {super.key,
      required this.taskController,
      required this.sheetTitle,
      this.taskDataofUpdate});

  Data? taskDataofUpdate;
  String sheetTitle;
  final TaskController taskController;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Obx(
        () => 
           Container(
            decoration: const BoxDecoration(
                color: colorLight,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25))),
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sheetTitle,
                    style: Head1Text(colorDarkBlue),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RadioListTile(
                    title: const Text("New"),
                    value: "New",
                    groupValue: taskController.statusValue.value,
                    onChanged: (value) {
                     taskController.statusValue.value = value!;
                     }
                  ),
                  RadioListTile(
                    title: const Text("Progress"),
                    value: "Progress",
                    groupValue: taskController.statusValue.value,
                    onChanged: (value) {
                     taskController.statusValue.value = value!;
                     }
                  ),
                  RadioListTile(
                    title: const Text("Completed"),
                    value: "Completed",
                    groupValue: taskController.statusValue.value,
                    onChanged: (value) {
                     taskController.statusValue.value = value!;
                     }
                  ),
                  RadioListTile(
                    title: const Text("Canceled"),
                    value: "Canceled",
                    groupValue: taskController.statusValue.value,
                   onChanged: (value) {
                     taskController.statusValue.value = value!;
                     }
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: AppButtonStyle(),
                      onPressed: () async {
                        taskController.requestForUpdateStatusTask(taskDataofUpdate!.sId, taskController.statusValue.value);
                      },
                      child: Obx(
                        () => taskController.isLoading.value == true
                            ? const Center(child: CircularProgressIndicator())
                            : SuccessButtonChild(
                                textColor: colorWhite, ButtonText: 'Add Task'),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
