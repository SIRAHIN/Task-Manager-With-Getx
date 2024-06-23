import 'package:get/get.dart';
import 'package:task_manager/routes/routes_name.dart';
import 'package:task_manager/screens/auth%20screens/email_verification_screen.dart';
import 'package:task_manager/screens/auth%20screens/login_screen.dart';
import 'package:task_manager/screens/auth%20screens/pin_verification_screen.dart';
import 'package:task_manager/screens/auth%20screens/registration_screen.dart';
import 'package:task_manager/screens/auth%20screens/set_password_screen.dart';
import 'package:task_manager/screens/splash%20screen/splash_screen.dart';
import 'package:task_manager/screens/tasks%20screen/components/cancel_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/completed_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/new_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/components/progress_task_list.dart';
import 'package:task_manager/screens/tasks%20screen/home_scree.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen()),
  GetPage(name: RoutesName.loginScreen, page: () => LoginScreen()),
  GetPage(
      name: RoutesName.registrationScreen, page: () => RegistrationScreen()),
  GetPage(
      name: RoutesName.emailVerificationScreen,
      page: () => EmailVerificationScreen()),
  GetPage(
      name: RoutesName.pinVerificationScreen,
      page: () => PinVerificationScreen()),
  GetPage(name: RoutesName.setPasswordScreen, page: () => SetPasswordScreen()),
  GetPage(name: RoutesName.homeScreen, page: () =>  HomeScreen()),
  GetPage(
      name: RoutesName.cancelTaskListScreen,
      page: () => const CancelTaskList()),
  GetPage(
  name: RoutesName.newTaskListScreen, 
  page: () =>   const NewTaskList()),
  GetPage(
      name: RoutesName.progressTaskListScreen,
      page: () => const ProgressTaskList()),
  GetPage(
      name: RoutesName.completedTaskListScreen,
      page: () => const CompletedTaskList()),
];
