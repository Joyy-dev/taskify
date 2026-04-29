import 'package:flutter/material.dart';

class ProgressContainer extends StatelessWidget {
  const ProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'In Progress',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 5,),
                Text(
                  '12',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Due Today',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5,),
                Text(
                  '4',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 5,),
                Text(
                  '5',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}