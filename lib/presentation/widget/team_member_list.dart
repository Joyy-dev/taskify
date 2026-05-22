import 'package:flutter/material.dart';
import 'package:taskify/presentation/widget/custom_container.dart';

class TeamMemberList extends StatelessWidget {
  const TeamMemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                      'Lead'.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                'Alex Rivera',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Lead Product Strategist',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                      onPressed: () {}, 
                      child: Text(
                        'Profile'
                      )
                    ),
                  ),
                  const SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(Icons.message_outlined, color: Theme.of(context).colorScheme.onSurfaceVariant,),
                  )
                ],
              )
            ],
          )
        ),
        const SizedBox(height: 20,),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text(
                      'Strategist'.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                'Sarah Chen',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Senior UX Strategist',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                      onPressed: () {}, 
                      child: Text(
                        'Profile'
                      )
                    ),
                  ),
                  const SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(Icons.message_outlined, color: Theme.of(context).colorScheme.onSurfaceVariant,),
                  )
                ],
              )
            ],
          )
        )
      ],
    );
  }
}