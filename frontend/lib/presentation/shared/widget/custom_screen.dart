import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/shared/controllers/theme_controllers.dart';

class CustomScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? leading;
  final Widget? floatingActionButton;

  CustomScreen({
    required this.title, 
    required this.child, 
    this.leading,
    this.floatingActionButton,
    super.key
  });

  final ThemeControllers controllers = Get.find<ThemeControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: leading,
        title: Text(
          title
        ),
        actions: [
          IconButton(
            onPressed: controllers.toggleTheme, 
            icon: Icon(Icons.brightness_4_rounded)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications)
          )
        ],
      ),
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: child,
        )
      ),
    );
  }
}