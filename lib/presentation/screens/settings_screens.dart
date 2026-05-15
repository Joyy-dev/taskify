import 'package:flutter/material.dart';
import 'package:taskify/features/account_privacy.dart';
import 'package:taskify/features/appearance.dart';
import 'package:taskify/presentation/widget/custom_screen.dart';
import 'package:taskify/presentation/widget/flow_state.dart';
import 'package:taskify/features/preference.dart';
import 'package:taskify/presentation/widget/profile_container.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      title: 'Taskify', 
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Manage your account and workspace preference'
            ),
            const SizedBox(height: 20,),
            ProfileContainer(),
            const SizedBox(height: 20,),
            FlowState(),
            const SizedBox(height: 20,),
            Preference(),
            const SizedBox(height: 20,),
            Appearance(),
            const SizedBox(height: 20,),
            AccountPrivacy()
          ],
        ),
      )
    );
  }
}