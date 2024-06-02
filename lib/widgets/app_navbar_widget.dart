import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';
import 'package:task_manager/style/style.dart';

class AppNavBarWidget extends StatelessWidget {
  const AppNavBarWidget({
    super.key,
    required this.taskController,
  });

  final TaskController taskController;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: taskController.bottomNavIndex.value,
        onTap: (value) {
          taskController.changeBtmNavIndex(value);
        },
        selectedFontSize: 15,
        selectedItemColor: colorGreen,
        unselectedItemColor: colorLightGray,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.doc_text), label: "New Task"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_clockwise),
              label: "Progress"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.checkmark_alt), label: "Complete"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.clear_thick), label: "Cancel")
        ]);
  }
}
