import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/style/style.dart';

import '../controller/task_controller.dart';

class CompletedTaskList extends StatelessWidget {
  const CompletedTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<TaskController>(
            builder: (controller) {
              if (controller.isLoading.value == true) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.taskModelData!.data!.isEmpty) {
                return Center(
                  child:Container(
          alignment: Alignment.center,
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: colorGreen.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)
          ),
          child: const  Text("No complete Task!"),
                      ),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.taskModelData!.data!.length,
                  itemBuilder: (context, index) {
                    var listData = controller.taskModelData!.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                      backgroundColor: colorOrange,
                        child: Text('${index+1}'
                        
                        ),
                      ),
                      title: Text(listData.title.toString()),
                      subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const SizedBox(height: 7),
                          Text(listData.description.toString()),
                          const SizedBox(height: 7),
                          Text("Date :${listData.createdDate}"),
                           const SizedBox(height: 7),
                          Container(
                          alignment: Alignment.center,
                          width: 80,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colorGreen
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(listData.status.toString(),
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
          
                        }, icon: const Icon(Icons.recycling)),
                         IconButton(
                        
                         color: colorRed,
                         onPressed: () {
                        
                        }, icon: const Icon(Icons.delete))
                      ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),     
      ),
    );
  }
}