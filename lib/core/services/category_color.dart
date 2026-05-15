import 'package:flutter/material.dart';
import 'package:taskify/core/enums/priority_levels.dart';

Color getLevelColor(BuildContext context, PriorityLevels level) {
  switch (level) {
    case PriorityLevels.low:
    return Theme.of(context).colorScheme.tertiary;
    case PriorityLevels.medium:
    return Theme.of(context).colorScheme.primaryContainer;
    case PriorityLevels.high:
    return Theme.of(context).colorScheme.surfaceTint;    
  }
}