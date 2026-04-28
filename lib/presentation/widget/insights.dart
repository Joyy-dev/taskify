import 'package:flutter/material.dart';

class Insights extends StatelessWidget {
  const Insights({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.switch_access_shortcut_add,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          title: Text(
            'Optimized Schedule',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          subtitle: Text(
            'I\'ve moved your "Email catch-up" to 2:00PM when your focus levels are typically lower',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 10,),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          title: Text(
            'Team Momentum',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          subtitle: Text(
            'Sarah completed  4 shared tasks today. You\'re  on track to finish the sprint early!',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}