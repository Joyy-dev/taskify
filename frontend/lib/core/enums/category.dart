import 'package:flutter/material.dart';

enum Category {
  work('Work', Icons.work),
  personal('Personal', Icons.person),
  finance('Finance', Icons.monetization_on),
  health('Health', Icons.health_and_safety);

  final String label;
  final IconData icon;
  const Category (this.label, this.icon);
}