import 'package:flutter/material.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/core/services/category_color.dart';

class PriorityLevel extends StatefulWidget {
  final Function(PriorityLevels) onSelected;
  const PriorityLevel({required this.onSelected, super.key});

  @override
  State<PriorityLevel> createState() => _PriorityLevelState();
}

class _PriorityLevelState extends State<PriorityLevel> {
  
  PriorityLevels? selectedLevel;

  Widget buildItem(String label, PriorityLevels level) {
    final isSelected = selectedLevel == level;
    final color = getLevelColor(context, level);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedLevel = level;
          });
          widget.onSelected(level);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
          decoration: BoxDecoration(
            color: isSelected
                ? color
                : Theme.of(context).colorScheme.inverseSurface,
            border: Border.all(
              color: isSelected ? color : const Color(0xFF68788f),
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PRIORITY LEVEL',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            buildItem('Low', PriorityLevels.low),
            const SizedBox(width: 10),
            buildItem('Medium', PriorityLevels.medium),
            const SizedBox(width: 10),
            buildItem('High', PriorityLevels.high),
          ],
        ),
      ],
    );
  }
}