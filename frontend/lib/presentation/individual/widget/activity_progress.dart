import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/individual/controllers/task_controllers.dart';
import 'package:taskify/presentation/individual/widget/circular_progress.dart';

class ActivityProgress extends StatelessWidget {
  const ActivityProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =  Get.find<TaskControllers>();
    return Obx(() {
      final totalTask = controller.todayTask.length;
      final completedTask = controller.completedTodayTask.length;
      final progress = controller.dailyProgress;
      return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgress(
                value: progress
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          const SizedBox(height: 25,),
          Text(
            'Daily Goal',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4,),
          Text(
            totalTask == 0 ? 'No tasks Schedule for today' : '$completedTask tasks completed',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
    });
  }
}