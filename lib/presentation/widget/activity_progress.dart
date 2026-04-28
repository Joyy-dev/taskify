import 'package:flutter/material.dart';

class ActivityProgress extends StatelessWidget {
  const ActivityProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: 0.75,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              Text(
                '75%',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          const SizedBox(height: 25,),
          Text(
            'Daily Goal',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 4,),
          Text(
            '6 of 8 tasks completed',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}