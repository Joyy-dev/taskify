import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/controllers/theme_controllers.dart';

class CustomScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomScreen({
    required this.title, 
    required this.child, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeControllers>();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.grid_view_sharp),
        title: Text(
          title
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.toggleTheme();
            }, 
            icon: Icon(Icons.brightness_4_rounded)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onSurfaceVariant,),
      ),
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