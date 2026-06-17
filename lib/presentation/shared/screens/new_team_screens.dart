import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskify/presentation/shared/widget/custom_screen.dart';
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
          ],
        ),
      )
    );
  }
}