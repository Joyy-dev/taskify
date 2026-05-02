import 'package:flutter/material.dart';
import 'package:taskify/core/enums/priority_levels.dart';
import 'package:taskify/core/services/category_color.dart';

class TaskContainer extends StatelessWidget {
  final Widget child;
  final PriorityLevels priority;
  const TaskContainer({required this.priority, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final color = getLevelColor(context, priority);
    return Container(
      padding: EdgeInsets.all(17),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            width: 4,
            color: color
          )
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF283044)
          )
        ]
      ),
      child: child,
    );
  }
}