import 'package:flutter/material.dart';

class SpecialContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;

  const SpecialContainer({
    required this.child, 
    this.margin,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10)
      ),
      child: child,
    );
  }
}