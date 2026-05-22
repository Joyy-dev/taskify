import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double value;
  const CircularProgress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: CircularProgressIndicator(
        strokeWidth: 10,
        value: value,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.primary),
      ),
    );
  }
}