import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/controllers/task_controllers.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskControllers>();
    return Row(
      children: [
        Expanded(
          child: SearchBar(
            leading: Icon(Icons.search, color: Color(0xFF565e74),),
            hintText: 'Search tasks...',
            hintStyle: WidgetStatePropertyAll(TextStyle(color: Color(0xFF777587))),
            textStyle: WidgetStatePropertyAll(Theme.of(context).textTheme.bodyMedium),
            onChanged: (value) {
              controller.updateSearch(value);
            },

          ),
        ),
        const SizedBox(width: 10,),
      ],
    );
  }
}