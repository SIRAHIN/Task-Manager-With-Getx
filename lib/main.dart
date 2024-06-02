import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/dependency/controller_bindings.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/routes/routes_screens.dart';
import 'package:task_manager/utils/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await StoredData.readUserData("token");
  print("your token is  $token");
   runApp(MyApp(
    routeName: token == null ? RoutesName.loginScreen : RoutesName.homeScreen,
  ));
 
} 

class MyApp extends StatelessWidget {
  final String? routeName;
  const MyApp({super.key, this.routeName });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      getPages: routes,
      initialRoute: routeName,
      initialBinding: ControllerBindings(),
    );
  }
}