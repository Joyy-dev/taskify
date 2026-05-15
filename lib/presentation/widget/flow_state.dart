import 'package:flutter/material.dart';

class FlowState extends StatelessWidget {
  const FlowState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.primaryContainer
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.flash_on, size: 30, color: Color(0xFF000767),),
          const SizedBox(height: 10,),
          Text(
            'Flow State',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF000767),
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'You\'ve completed 12 focused hours this week keep the momentum going',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weekly Goal',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF000767),
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                '80%',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF000767),
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          LinearProgressIndicator(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(10),
            value: 0.8,
            valueColor: AlwaysStoppedAnimation(Color(0xFF000767)),
          )
        ],
      ),
    );
  }
}