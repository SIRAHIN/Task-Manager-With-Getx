import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/dependency/controller_bindings.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/routes/routes_screens.dart';
import 'package:task_manager/utils/utility.dart';

void main()  {
   runApp(const MyApp(
  ));
 
} 

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      getPages: routes,
      initialRoute: RoutesName.splashScreen,
      initialBinding: ControllerBindings(),
    );
  }
}