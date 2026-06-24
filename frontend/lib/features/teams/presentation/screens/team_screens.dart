import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:taskify/features/teams/presentation/screens/new_team_screens.dart';
import 'package:taskify/shared/widgets/custom_screen.dart';
import 'package:taskify/features/teams/presentation/widgets/team_activity.dart';
import 'package:taskify/features/teams/presentation/widgets/team_member_list.dart';
import 'package:taskify/features/teams/presentation/widgets/team_monthly_goal.dart';

class TeamScreens extends StatelessWidget {
  const TeamScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      leading: Icon(Icons.grid_view),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workspace'.toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Product Team',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 5,),
            Text(
              'Manage your core team member and their availabilty ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => NewTeamScreens());
                  }, 
                  child: Row(
                    children: [
                      Icon(Icons.person_add_alt),
                      const SizedBox(width: 5,),
                      Text(
                        'Invite Member'
                      )
                    ],
                  )
                ),
              ],
            ),
            const SizedBox(height: 20,),
            TeamMemberList(),
            const SizedBox(height: 20,),
            TeamActivity(),
            const SizedBox(height: 20,),
            TeamMonthlyGoal()
          ],
        ),
      )
    );
  }
}