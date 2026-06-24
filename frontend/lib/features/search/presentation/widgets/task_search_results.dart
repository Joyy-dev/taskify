import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskify/core/enums/category.dart';
import 'package:taskify/core/services/category_color.dart';
import 'package:taskify/features/search/presentation/controllers/search_controllers.dart';
import 'package:taskify/shared/widgets/custom_container.dart';
//import 'package:taskify/presentation/widget/special_container.dart';

class TaskSearchResults extends StatelessWidget {
  const TaskSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllers>();
    final categoryTag = Category.values;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle_rounded),
                const SizedBox(width: 5,),
                Text(
                  'Tasks',
                  style: Theme.of(context).textTheme.headlineLarge,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(
                '${controller.searchedQueryCount} results'.toUpperCase()
              ),
            ),  
          ],
        ),
        const SizedBox(height: 30,),
        Obx(() {
          if (controller.searchQuery.value.isNotEmpty && controller.searchedTasks.isEmpty) {
            return Center(
              child: Text(
                'No tasks matching your Query found'
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.searchedTasks.length,
              itemBuilder: (context, index) {
                final task = controller.searchedTasks[index];
                final color = getLevelColor(context, task.priority);
                final category = categoryTag[index];
                return CustomContainer(
                  margin: EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    minLeadingWidth: 4,
                    leading: Container(
                      height: 80,
                      width: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    title: Text(
                      task.taskTitle
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 20,),
                        const SizedBox(width: 5,),
                        Text(
                          DateFormat('MMM dd, yyyy').format(task.dueDate)
                        ),
                        const SizedBox(width: 20,),
                        Icon(category.icon, size: 20,),
                        const SizedBox(width: 5,),
                        Text(
                          category.label
                        )
                      ],
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(9)
                      ),
                      child: Text(
                        task.priority.name.toUpperCase(),
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  )
                );
              },
            );
          }      
        })
      ],
    );
  }
}