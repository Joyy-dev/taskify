import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/features/auth/presentation/screens/auth_screens.dart';
import 'package:taskify/shared/controllers/navigation_controllers.dart';
import 'package:taskify/features/tasks/presentation/screens/home_screens.dart';
import 'package:taskify/features/settings/presentation/screens/settings_screens.dart';
import 'package:taskify/features/tasks/presentation/screens/task_list_screen.dart';
import 'package:taskify/features/teams/presentation/screens/team_screens.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final controller = Get.put(NavigationControllers());

  final List<Widget> _screens = [
    AuthScreens(),
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
            icon: Icon(Icons.app_registration),
            label: 'Auth'
          ),
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