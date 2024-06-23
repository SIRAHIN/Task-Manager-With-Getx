import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';
import 'package:task_manager/style/style.dart';

import '../screens/tasks screen/model/task_model.dart';

class AddtaskBottomSheet extends StatelessWidget {
  AddtaskBottomSheet(
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
        child: Container(
          decoration: const BoxDecoration(
              color: colorLightGray,
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
                TextFormField(
              
                  onChanged: (value) {
                    taskController.setFormValue('title', value);
                  },
                  decoration: AppInputDecoration(hText: 'Title'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  
                  maxLines: 5,
                  onChanged: (value) {
                    taskController.setFormValue('description', value);
                  },
                  decoration: AppInputDecoration(hText: 'Desciption'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: AppButtonStyle(),
                    onPressed: () async {
                      if (taskController.formValue['title']!.isEmpty) {
                        ErrorToast("Title is Empty");
                      } else if (taskController
                          .formValue['description']!.isEmpty) {
                        ErrorToast("Description is Empty");
                      } else {
                        await taskController.createTaskRequest();
                      }
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
    );
  }
}