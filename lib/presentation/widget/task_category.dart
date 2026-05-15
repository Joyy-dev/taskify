import 'package:flutter/material.dart';
import 'package:taskify/core/enums/task_time.dart';

class ProgressContainer extends StatefulWidget {
  const ProgressContainer({super.key});

  @override
  State<ProgressContainer> createState() => _ProgressContainerState();
}

class _ProgressContainerState extends State<ProgressContainer> {
  final int onSelected = 0;
  @override
  Widget build(BuildContext context) {
    final cat = TaskTime.values;
    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: cat.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final title = cat[index];
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color:Theme.of(context).colorScheme.surfaceContainer,
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
                    '12',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            );
        },
      ),
    );
  }
}