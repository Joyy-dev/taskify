import 'package:flutter/material.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/core/services/category_color.dart';

class PriorityLevel extends StatelessWidget {
  final Function(PriorityLevels) onSelected;
  final PriorityLevels? selectedPriority;
  
  const PriorityLevel({super.key, required this.onSelected, this.selectedPriority});

  @override
  Widget build(BuildContext context) {
    final priority = PriorityLevels.values;
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: priority.length,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final label = priority[index];
          final isSselected = selectedPriority == label;
          return SizedBox(
            height: 60,
            width: 140,
            child: GestureDetector(
              onTap: () => onSelected(label),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: isSselected ? getLevelColor(context, label) : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceContainer
                  )
                ),
                child: Text(
                  label.name,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}