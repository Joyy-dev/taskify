import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/shared/controllers/navigation_controllers.dart';
import 'package:taskify/presentation/individual/screens/home_screens.dart';
import 'package:taskify/presentation/shared/screens/settings_screens.dart';
import 'package:taskify/presentation/individual/screens/task_list_screen.dart';
import 'package:taskify/presentation/team/screens/team_screens.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final controller = Get.put(NavigationControllers());

  final List<Widget> _screens = [
    HomeScreens(),
    TaskListScreen(),
    TeamScreens(),
    SettingsScreens()
  ];

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Dashboard'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Tasks'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Team'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
          )
        ]
      ),
      ),
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: _screens,
      ),
    )      
    );
  }
}