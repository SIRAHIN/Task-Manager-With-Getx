import 'package:get/get.dart';
import 'package:task_manager/screens/auth%20screens/controller/auth_controller.dart';
import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';

class ControllerBindings implements Bindings {

 @override
 void dependencies() {
   Get.lazyPut(() => AuthController(), fenix: true);
   Get.lazyPut(() => TaskController(), fenix: true);
 }
}