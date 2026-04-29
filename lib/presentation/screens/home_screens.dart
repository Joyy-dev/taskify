import 'package:flutter/material.dart';
import 'package:taskify/presentation/widget/activity_progress.dart';
import 'package:taskify/presentation/widget/categories_container.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';
import 'package:taskify/presentation/widget/focus_container.dart';
import 'package:taskify/presentation/widget/insights.dart';
import 'package:taskify/presentation/widget/upcoming_deadline.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          CategoriesContainer(),
          const SizedBox(height: 45,),
          ActivityProgress(),
          const SizedBox(height: 30,),
          Text(
            'Upcoming Deadlines',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10,),
          UpcomingDeadline(),
          const SizedBox(height: 30,),
          Text(
            'Smart Insights',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10,),
          Insights()
        ],
      )
    );
  }
}