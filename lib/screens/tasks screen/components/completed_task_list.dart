import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompletedTaskList extends StatelessWidget {
  const CompletedTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("complete task")),
    );
  }
}