import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/enums/task_filter.dart';
import 'package:taskify/features/search/presentation/controllers/search_controllers.dart';

class TotalTaskFilter extends StatefulWidget {
  const TotalTaskFilter({super.key});

  @override
  State<TotalTaskFilter> createState() => _ProgressContainerState();
}

class _ProgressContainerState extends State<TotalTaskFilter> {

  @override
  Widget build(BuildContext context) {
    final filter = TaskFilter.values;
    final controller = Get.find<SearchControllers>();
    return SizedBox(
      height: 70,
      child: ListView.builder(
          itemCount: filter.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final title = filter[index];
            final isSelected = controller.selectedFilter.value == title;
            return GestureDetector(
              onTap: () {
                controller.setFilter(title);
              },
              child: Container(
              width: 120,
              margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: isSelected ? Theme.of(context).colorScheme.onTertiaryContainer : Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.text,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      '${controller.gettaskFilterCount(title)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            );
        },
      )
    );
  }
}