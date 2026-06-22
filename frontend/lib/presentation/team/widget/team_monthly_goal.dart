import 'package:flutter/material.dart';
import 'package:taskify/presentation/individual/widget/circular_progress.dart';
import 'package:taskify/presentation/shared/widget/special_container.dart';

class TeamMonthlyGoal extends StatelessWidget {
  const TeamMonthlyGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return SpecialContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Goal',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 50,),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgress(
                  value: 0.75
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '75%\n',
                    style: Theme.of(context).textTheme.headlineLarge,
                    children: [
                      TextSpan(
                        text: 'Complete'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall
                      )
                    ]
                  )
                )
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Text(
            'On track to deliver the unified design system by end of month',
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
}