import 'package:flutter/material.dart';
import 'package:taskify/presentation/shared/widget/custom_container.dart';
import 'package:taskify/presentation/shared/widget/custom_form.dart';

class TeamForm extends StatelessWidget {
  const TeamForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            child: Column(
              children: [
                CustomForm(
                  tag: 'Email Address', 
                  hint: 'colleague@company.com',
                  prefixIcon: Icon(Icons.email_outlined),
                  controller: TextEditingController()
                )
              ],
            )
          ),
          const SizedBox(height: 20,),
          Text(
            'Select Role',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person_outline),
                Text(
                  'Member'
                ),
                Text(
                  'Can create tasks and manage their own work.'
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.admin_panel_settings_outlined),
                Text(
                  'Admin'
                ),
                Text(
                  'Full access to settings, billing, and team.'
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.remove_red_eye_outlined),
                Text(
                  'Viewer'
                ),
                Text(
                  'Read-only access to specific shared boards'
                )
              ],
            ),
          )
        ],
      )
    );
  }
}