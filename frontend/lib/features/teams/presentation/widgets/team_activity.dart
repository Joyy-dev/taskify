import 'package:flutter/material.dart';
import 'package:taskify/shared/widgets/custom_container.dart';
import 'package:taskify/shared/widgets/special_container.dart';

class TeamActivity extends StatelessWidget {
  const TeamActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Team Activity',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Active Now',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          const SizedBox(height: 20,),
          SpecialContainer(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.barcode_reader),
              ),
              title: RichText(
                text: TextSpan(
                  text: 'Sarah updated ',
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: 'User Personas',
                      style: Theme.of(context).textTheme.headlineSmall
                    )
                  ]
                )
              ),
              subtitle: Text(
                '14 minutes ago',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SpecialContainer(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.barcode_reader),
              ),
              title: RichText(
                text: TextSpan(
                  text: 'Marcus merged ',
                  style: Theme.of(context).textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: 'PR #442: Grid Refactor',
                      style: Theme.of(context).textTheme.headlineSmall
                    )
                  ]
                )
              ),
              subtitle: Text(
                '2 hours ago',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          )
        ],
      )
    );
  }
}