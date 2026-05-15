import 'package:flutter/material.dart';

class SpecialContainer extends StatelessWidget {
  final Widget child;
  const SpecialContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }
}