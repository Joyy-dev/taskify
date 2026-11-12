import 'dart:collection';

import 'package:flutter/material.dart';

class AppThemeExtension {
  final Color primary;
  final Color primaryPressed;
  final Color primaryContainer;
  final Color background;
  final Color surface;
  final Color surfaceSubtle;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color success;
  final Color warning;

  const AppThemeExtension({
    required this.primary,
    required this.primaryPressed,
    required this.primaryContainer,
    required this.background,
    required this.surface,
    required this.surfaceSubtle,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.success,
    required this.warning,
  });

  @override
  AppThemeExtension copyWith({
    Color? primary,
    Color? primaryPressed,
    Color? primaryContainer,
    Color? background,
    Color? surface,
    Color? surfaceSubtle,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? success,
    Color? warning
  }) {
    return AppThemeExtension(
      primary: primary ?? this.primary, 
      primaryPressed: primaryPressed ?? this.primaryPressed, 
      primaryContainer: primaryContainer ?? this.primaryContainer, 
      background: background ?? this.background, 
      surface: surface ?? this.surface, 
      surfaceSubtle: surfaceSubtle ?? this.surfaceSubtle, 
      textPrimary: textPrimary ?? this.textPrimary, 
      textSecondary: textSecondary ?? this.textSecondary, 
      border: border ??  this.border, 
      success: success ?? this.success, 
      warning: warning ?? this.warning
    );
  }
}