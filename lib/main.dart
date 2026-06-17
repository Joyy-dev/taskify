import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskify/core/services/notification_service.dart';
import 'package:taskify/core/theme/app_theme.dart';
import 'package:taskify/presentation/shared/controllers/search_controllers.dart';
import 'package:taskify/presentation/individual/controllers/task_controllers.dart';
import 'package:taskify/presentation/individual/controllers/task_detail_controllers.dart';
import 'package:taskify/presentation/shared/controllers/task_form_controllers.dart';
import 'package:taskify/presentation/shared/controllers/theme_controllers.dart';
import 'package:taskify/presentation/shared/widget/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await NotificationService.init();
  // final box = GetStorage();
  // box.erase();
  Get.put(ThemeControllers());
  Get.put(TaskControllers());
  Get.put(TaskDetailControllers());
  Get.put(TaskFormControllers());
  Get.put(SearchControllers());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taskify',
      theme: AppTheme.lightMode,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkMode,
      home: Navigation(),
    );
  }
}