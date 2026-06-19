import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/shared/widget/custom_screen.dart';
import 'package:taskify/presentation/shared/widget/project_access.dart';
import 'package:taskify/presentation/team/widget/team_form.dart';

class NewTeamScreens extends StatelessWidget {
  const NewTeamScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      leading: Icon(Icons.grid_view),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  }, 
                  child: Text(
                    'Team'
                  )
                ),
                Icon(Icons.chevron_right),
                Text(
                  'Add Member',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            Text(
              'Invite new team member',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 5,),
            Text(
              'Expand your workspace by inviting new collaborators. Assign roles and define project access levels instantly'
            ),
            const SizedBox(height: 30,),
            TeamForm(),
            const SizedBox(height: 20,),
            ProjectAccess(),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {}, 
                    child: Text(
                      'Send Invitations'
                    )
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.onSurfaceVariant
                      )
                    ),
                    child: TextButton(
                      onPressed: () {}, 
                      child: Text('Cancel')
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}