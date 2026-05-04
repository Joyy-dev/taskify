// import 'package:flutter/material.dart';
// import 'package:taskify/core/enums/priority_levels.dart';
// import 'package:taskify/core/services/category_color.dart';

// class PriorityLevel extends StatelessWidget {
//   final Function(PriorityLevels) onSelected;
//   const PriorityLevel({required this.onSelected, super.key});

//   Widget buildItem(String label, PriorityLevels level, BuildContext context) {
//       final color = getLevelColor(context, level);

//       return Expanded(
//         child: GestureDetector(
//           onTap: () => onSelected(level),
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? color
//                   : Theme.of(context).colorScheme.inverseSurface,
//               border: Border.all(
//                 color: isSelected ? color : const Color(0xFF68788f),
//               ),
//               borderRadius: BorderRadius.circular(13),
//             ),
//             child: Text(
//               label,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.displayMedium,
//             ),
//           ),
//         ),
//       );
//     } 

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'PRIORITY LEVEL',
//           style: Theme.of(context).textTheme.bodySmall,
//         ),
//         const SizedBox(height: 5),
//         Row(
//           children: [
//             buildItem('Low', PriorityLevels.low, context),
//             const SizedBox(width: 10),
//             buildItem('Medium', PriorityLevels.medium, context),
//             const SizedBox(width: 10),
//             buildItem('High', PriorityLevels.high, context),
//           ],
//         ),
//       ],
//     );
//   }
// }

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