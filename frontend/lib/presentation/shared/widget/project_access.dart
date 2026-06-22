import 'package:flutter/material.dart';
import 'package:taskify/presentation/shared/widget/custom_container.dart';
import 'package:taskify/presentation/shared/widget/special_container.dart';

class ProjectAccess extends StatelessWidget {
  const ProjectAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Project Access'.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall
              ),
              TextButton(
                onPressed: () {}, 
                child: Text('Select All')
              )
            ],
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SpecialContainer(
                margin: EdgeInsets.only(bottom: 10),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.circle,
                size: 20,
                color: Theme.of(context).colorScheme.error
              ),
              title: Text(
                'Q4 Strategic Roadmap'
              ),
              subtitle: Row(
                children: [
                  Text(
                    'Departmental',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 5,),
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Theme.of(context).colorScheme.primary
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    '12 members',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              trailing: Checkbox(
                value: false, 
                onChanged: (value) {
                  value = value;
                },
              ),
            )
          );
            },
          ),
        ],
      )
    );
  }
}