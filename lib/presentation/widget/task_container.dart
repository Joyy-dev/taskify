import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  final Widget child;
  const TaskContainer({ required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            width: 4,
            color: Theme.of(context).colorScheme.onError
          )
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF283044)
          )
        ]
      ),
      child: child,
    );
  }
}