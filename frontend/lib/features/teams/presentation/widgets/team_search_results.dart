import 'package:flutter/material.dart';
import 'package:taskify/shared/widgets/custom_container.dart';

class TeamSearchResults extends StatelessWidget {
  const TeamSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.people),
                const SizedBox(width: 5,),
                Text(
                  'Team Members',
                  style: Theme.of(context).textTheme.headlineLarge,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(
                '1 Results'.toUpperCase()
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        CustomContainer(
          child: ListTile(
            leading: CircleAvatar(),
            title: Text(
              'Alex Rivera',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'Lead Strategy Consultant'
            ),
            trailing: Icon(Icons.message_outlined),
          )
        )
      ],
    );
  }
}