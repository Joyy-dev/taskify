import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.decal,
          colors: [
            Theme.of(context).colorScheme.onPrimary,
            Theme.of(context).colorScheme.onPrimary,
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface
          ],
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceContainer
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(),
            title: Text(
              'Alex Rivera'
            ),
            subtitle: Text(
              'Senior Product Designer'
            ),
            trailing: ElevatedButton(
              onPressed: () {}, 
              child: Text(
                'Edit Profile'
              )
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceTint,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email Address',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  'alex.rivera@taskify.com',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceTint,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Timezone',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  'Pacific Standard Time (GMT-8)',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}