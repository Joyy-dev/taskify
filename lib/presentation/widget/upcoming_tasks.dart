import 'package:flutter/material.dart';
import 'package:taskify/presentation/widget/task_container.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Tasks',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20,),
        TaskContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                      'High Priority'.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.more_vert, color: Color(0xFF565e74),)
                  )
                ],
              ),
              Text(
                'Finalize Project Proposal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 5,),
              Text(
                'Review budget allocations and technical specifications with the architecture team',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20,),
              Divider(),
              const SizedBox(height: 10,)
            ],
          )
        )
      ],
    );
  }
}