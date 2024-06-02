import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';
import 'package:task_manager/widgets/app_navbar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: taskController.widgetClassList[taskController.bottomNavIndex.value],
        bottomNavigationBar: AppNavBarWidget(taskController: taskController),
      ),
    );
  }
}

