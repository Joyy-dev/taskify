import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/core/services/category_color.dart';
import 'package:taskify/presentation/controllers/task_form_controllers.dart';

class PriorityLevel extends StatelessWidget {
  final Function(PriorityLevels) onSelected;

  PriorityLevel({
    required this.onSelected,
    super.key
  });

  final controller = Get.find<TaskFormControllers>();

  @override
  Widget build(BuildContext context) { 
    return Obx(() {
      final selected = controller.selectedPriority.value;
        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: PriorityLevels.values.length,
            itemBuilder: (context, index) {
          final level = PriorityLevels.values[index];
          final color = getLevelColor(context, level);
          
          final isSelected = selected == level;
          final label = level.name;                    
              return SizedBox(
                width: 140,
                child: GestureDetector(
                  onTap: () => onSelected(level),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                    decoration: BoxDecoration(
                      color: isSelected ? color : Theme.of(context).colorScheme.inverseSurface,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: isSelected ? color : const Color(0xFF68788f)
                      ),
                    ),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              );
            },
          ));
        }
      );
    
    
    
    
    
  }
}