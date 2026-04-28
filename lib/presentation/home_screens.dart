import 'package:flutter/material.dart';
import 'package:taskify/presentation/widget/categories_container.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';
import 'package:taskify/presentation/widget/focus_container.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      child: Column(
        children: [
          FocusContainer(),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary,)
              )
            ],
          ),
          const SizedBox(height: 10,),
          CategoriesContainer()
        ],
      )
    );
  }
}