import 'package:flutter/material.dart';

class UpcomingDeadline extends StatelessWidget {
  const UpcomingDeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 50,
            width: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15)
            ),
          ),
          title: Text(
            'Landing Page Redesign',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          subtitle: Text(
            'Project Phoenix . Due Tomorrow',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Icon(Icons.chevron_right, color: Color(0xFF777681), size: 40,),
        ),
        ListTile(
          leading: Container(
            height: 50,
            width: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.circular(15)
            ),
          ),
          title: Text(
            'Finalize Invoice',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          subtitle: Text(
            'Finance . Due in 2hrs',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: Icon(Icons.chevron_right, color: Color(0xFF777681), size: 40,),
        ),
      ],
    );
  }
}