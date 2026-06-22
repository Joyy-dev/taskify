import 'package:flutter/material.dart';

class TaskCalendar extends StatelessWidget {
  const TaskCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Planning'.toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          CalendarDatePicker(
            initialDate: DateTime.now(), 
            firstDate: DateTime(2000), 
            lastDate: DateTime(2030), 
            onDateChanged: (value) {
              //
            },
          ),
        ],
      ),
    );
  }
}