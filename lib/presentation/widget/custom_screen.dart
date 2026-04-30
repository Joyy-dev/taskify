import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/controllers/theme_controllers.dart';

class CustomScreen extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData icon;
  final Widget? floatingActionButton;

  CustomScreen({
    required this.title, 
    required this.child, 
    required this.icon,
    this.floatingActionButton,
    super.key
  });

  final ThemeControllers controllers = Get.find<ThemeControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(icon),
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
          child: SingleChildScrollView(
            child: child
          ),
        )
      ),
    );
  }
}