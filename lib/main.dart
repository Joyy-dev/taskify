import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/theme/app_theme.dart';
import 'package:taskify/presentation/controllers/theme_controllers.dart';
import 'package:taskify/presentation/home_screens.dart';

void main() {
  Get.put(ThemeControllers());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taskify',
      theme: AppTheme.darkMode,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkMode,
      home: HomeScreens(),
    );
  }
}