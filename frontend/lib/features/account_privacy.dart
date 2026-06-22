import 'package:flutter/material.dart';
import 'package:taskify/presentation/shared/widget/custom_container.dart';
import 'package:taskify/presentation/shared/widget/special_container.dart';

class AccountPrivacy extends StatelessWidget {
  const AccountPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.shield_outlined),
            ),
            title: Text(
              'Security & Privacy',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              'Last password change: 3 months ago',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SpecialContainer(
                  child: TextButton(
                    onPressed: () {}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.change_circle_outlined),
                        const SizedBox(width: 5,),
                        Text('Change Password')
                      ],
                    )
                  )
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: SpecialContainer(
                  child: TextButton(
                    onPressed: () {}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.security_update_outlined),
                        const SizedBox(width: 5,),
                        Text('Setup 2FA')
                      ],
                    )
                  )
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {}, 
            child: Text(
              'Logout Everywhere'
            )
          )
        ],
      )
    );
  }
}