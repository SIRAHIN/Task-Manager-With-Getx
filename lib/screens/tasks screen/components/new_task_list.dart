import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/widgets/add_Task_bottom_sheet.dart';
import 'package:task_manager/widgets/custom_status_bottom_sheet.dart';
import 'package:task_manager/widgets/delete_task_widget.dart';
import 'package:task_manager/widgets/topCard_view.dart';

import '../controller/task_controller.dart';

class NewTaskList extends StatelessWidget {
  const NewTaskList({super.key});

  //final controllerTxt = Get.find<TaskController>();

  TaskController get taskController => Get.find();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => taskController.fetchTaskbyStatus('New'),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(child: TopCardView()),
                      Expanded(child: TopCardView()),
                      Expanded(child: TopCardView()),
                      Expanded(child: TopCardView()),
                    ],
                  ),
                  GetBuilder<TaskController>(
                    builder: (controller) {
                      if (controller.isLoading.value == true) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.taskModelData!.data!.isEmpty) {
                        return Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                color: colorGreen.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text("No New Task!"),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.taskModelData!.data!.length,
                          itemBuilder: (context, index) {
                            var listData =
                                controller.taskModelData!.data![index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: colorOrange,
                                child: Text('${index + 1}'),
                              ),
                              title: Text(listData.title.toString()),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 7),
                                  Text(listData.description.toString()),
                                  const SizedBox(height: 7),
                                  Text("Date: ${listData.createdDate}"),
                                  const SizedBox(height: 7),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: colorBlue),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        listData.status.toString(),
                                        style: Head7Text(colorWhite),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              trailing: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      color: colorGreen,
                                      onPressed: () {
                                        showModalBottomSheet(
                                          isDismissible: true,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return CustomStatusBottomSheet(
                                              taskController: taskController,
                                              sheetTitle: 'Update Task',
                                              taskDataofUpdate: listData,
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.recycling)),
                                  DeleteTaskWidget(
                                      taskController: taskController,
                                      listData: listData)
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: colorGreen,
            onPressed: () {
              showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddtaskBottomSheet(taskController: taskController, sheetTitle: 'Add New Task');
                },
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}





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

