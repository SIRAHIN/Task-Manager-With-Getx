import 'package:get/get.dart';
import 'package:task_manager/screens/auth%20screens/controller/auth_controller.dart';
import 'package:task_manager/screens/profile%20screen/controller/profile_update_controller.dart';
import 'package:task_manager/screens/tasks%20screen/controller/task_controller.dart';

class ControllerBindings extends Bindings {

 @override
 void dependencies() {
   Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
   Get.lazyPut<TaskController>(() => TaskController(), fenix: true);
   Get.lazyPut<ProfileUpdateController>(() => ProfileUpdateController(), fenix: true);
 }
}