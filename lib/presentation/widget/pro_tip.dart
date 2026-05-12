import 'package:flutter/material.dart';

class ProTip extends StatelessWidget {
  const ProTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline, color: Colors.white,),
              const SizedBox(width: 5,),
              Text(
                'Pro Tip'.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          RichText(
            text: TextSpan(
              text: 'Use the ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70
              ),
              children: [
                TextSpan(
                  text: 'Focus Mode',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2
                  )
                ),
                TextSpan(
                  text: ' timer to complete subtasks without distractions. Users who use timers are 40% more likely to finish tasks on time.'
                )
              ]
            )
          )
        ],
      ),
    );
  }
}