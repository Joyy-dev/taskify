import 'package:flutter/material.dart';
import 'package:taskify/core/enums/priority_levels.dart';

class PriorityLevel extends StatelessWidget {
  const PriorityLevel({super.key});

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
          return SizedBox(
            height: 60,
            width: 140,
            child: Card(
              child: Center(
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