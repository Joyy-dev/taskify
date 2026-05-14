import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskify/presentation/screens/new_task_screen.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';
import 'package:taskify/presentation/widget/task_calendar.dart';

class CalendarScreens extends StatelessWidget {
  const CalendarScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      child: Column(
        children: [
          TaskCalendar(),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('EEEE, dd MMM').format(DateTime.now()),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => NewTaskScreen());
                }, 
                child: Row(
                  children: [
                    Icon(
                      Icons.add
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      'New Tasks',
                    )
                  ],
                )
              )
            ],
          )
        ],
      )
    );
  }
}