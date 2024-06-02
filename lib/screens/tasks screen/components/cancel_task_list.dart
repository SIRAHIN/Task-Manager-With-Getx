import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CancelTaskList extends StatelessWidget {
  const CancelTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("cancel task")),
    );
  }
}