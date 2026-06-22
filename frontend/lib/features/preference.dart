import 'package:flutter/material.dart';
import 'package:taskify/presentation/shared/widget/custom_container.dart';
import 'package:taskify/presentation/shared/widget/special_container.dart';

class Preference extends StatelessWidget {
  const Preference({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.apps),
              const SizedBox(width: 5,),
              Text(
                'App Preferences',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          const SizedBox(height: 15,),
          SpecialContainer(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.notifications_active_outlined),
              title: Text(
                'Desktop Notifications'
              ),
              subtitle: Text(
                'Sound and banner alerts'
              ),
              trailing: IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.toggle_off_outlined, size: 50,)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SpecialContainer(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.notifications_active_outlined),
              title: Text(
                'Focus Mode'
              ),
              subtitle: Text(
                'Mute all during deep work'
              ),
              trailing: IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.toggle_on, size: 50,)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SpecialContainer(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.notifications_active_outlined),
              title: Text(
                'Team Update'
              ),
              subtitle: Text(
                'Activity in shared projects'
              ),
              trailing: IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.toggle_off_outlined, size: 50,)
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SpecialContainer(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.notifications_active_outlined),
              title: Text(
                'Email Digest'
              ),
              subtitle: Text(
                'Weekly performance summaries'
              ),
              trailing: IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.toggle_off_outlined, size: 50,)
              ),
            ),
          )
        ],
      ),
    );
  }
}