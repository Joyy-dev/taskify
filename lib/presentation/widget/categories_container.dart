import 'package:flutter/material.dart';

class CategoriesContainer extends StatelessWidget {
  const CategoriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onTertiary,
              border: Border(
                left: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary,
                  width: 5
                )
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.work),
                const SizedBox(height: 5,),
                Text(
                  'Work'
                ),
                const SizedBox(height: 5,),
                Text(
                  '12 Active Tasks'
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onTertiary,
              border: Border(
                left: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 5
                )
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person),
                const SizedBox(height: 5,),
                Text(
                  'Personal',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 5,),
                Text(
                  '5 Active Tasks'
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}