import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/enums/category.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) { 
    final controllers = Get.find<TaskControllers>();
    final container = Category.values; 
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: container.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = container[index];
          final activeTask = controllers.getTaskCountbyCategory(category);
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              border: Border(
                  left: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                    width: 5
                  )
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(category.icon, color: Theme.of(context).colorScheme.onSurface,),
                  const SizedBox(height: 20,),
                  Text(
                    category.label,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    activeTask == 0 ? 'No active tasks': '$activeTask Active Tasks',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            );
          },
        ),
    );
  }
}