import 'package:flutter/material.dart';

class AppTheme {
  static final lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 23,
        color: Color(0xFF3323cc),
        fontWeight: FontWeight.bold
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(
        color: Color(0xFF474650),
      ),
    ),
    scaffoldBackgroundColor: Color(0xFFe4e1ee),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF3323cc),
      unselectedItemColor: Color(0xFF474650),
      type: BottomNavigationBarType.fixed,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF3323cc),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
      splashColor: Colors.white
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.light, 
      primary: Color(0xFF3323cc), 
      onPrimary: Color(0xFFf2efff), 
      secondary: Color(0xFFc3c0ff), 
      onSecondary: Color(0xFF3323cc), 
      error: Colors.red, 
      onError: Colors.redAccent, 
      surface: Color(0xFF571f00), 
      onSurface: Color(0xFF505f76),
      outline: Color(0xFFc8c5d2),
      onTertiary: Color(0xFFc8c5d2),
      onPrimaryContainer: Color(0xFF213145),
      onSurfaceVariant: Colors.white,
      inverseSurface: Color(0xFFf2efff)
    ),

    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      elevation: WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )
      ),
      side: WidgetStatePropertyAll(
        BorderSide(
          width: 1,
          color: Color(0xFFc8c5d2)
        )
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Color(0xFF505f76)
        )
      ),
    ),

    dividerTheme: DividerThemeData(
      color: Color(0xFF777681),
      thickness: 1
    ),
    
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.black87,
        fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Color(0xFF777681),
        fontWeight: FontWeight.bold
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      headlineSmall: TextStyle(
        fontSize: 13,
        color: Color(0xFFf3effc),
        fontWeight: FontWeight.bold
      ),
      displayLarge: TextStyle(
        fontSize: 18,
        color: Color(0xFFf3effc)
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Color(0xFFf3effc),
        fontWeight: FontWeight.bold
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        color: Color(0xFFf3effc),
        fontWeight: FontWeight.bold
      ),
      labelSmall: TextStyle(
        fontSize: 15,
        color: Color(0xFFf3effc)
      )
    ),
  );

  static final darkMode = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 23,
        color: Color(0xFF8990a8),
        fontWeight: FontWeight.bold
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFbec6e0)
      ),
    ),
    scaffoldBackgroundColor: Color(0xFF131b2e),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xFF7c87f3),
      unselectedItemColor: Color(0xFFbec6e0),
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFa0a3ff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark, 
      primary: Color(0xFF283044), 
      onPrimary: Color(0xFFa0a3ff), 
      secondary: Color(0xFF283044), 
      onSecondary: Color(0xFFa0a3ff), 
      error: Colors.red, 
      onError: Colors.redAccent, 
      surface: Color(0xFF7c87f3), 
      onSurface: Color(0xFFffb783),
      outline: Color(0xFFbec6e0),
      onTertiary: Color(0xFF565e74),
      onPrimaryContainer: Color(0xFF703700),
      onSurfaceVariant: Color(0xFF131e8c),
      inverseSurface: Colors.transparent
    ),

    dividerTheme: DividerThemeData(
      color: Color(0xFF565e74),
      thickness: 1
    ),

    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        )
      ),
      side: WidgetStatePropertyAll(
        BorderSide(
          width: 1,
          color: Color(0xFF565e74)
        )
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Color(0xFF283044)
        )
      )
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Color(0xFFeef0ff),
        fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Color(0xFFeef0ff)
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Color(0xFFa3abc4),
        fontWeight: FontWeight.bold
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        color: Color(0xFFeef0ff),
        fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        color: Color(0xFFeef0ff),
        fontWeight: FontWeight.bold
      ),
      headlineSmall: TextStyle(
        fontSize: 13,
        color: Color(0xFFc0c1ff),
        fontWeight: FontWeight.bold
      ),
      displayLarge: TextStyle(
        fontSize: 18,
        color: Color(0xFFa3abc4)
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        color: Color(0xFFeef0ff),
        fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        color: Color(0xFF283044),
        fontWeight: FontWeight.bold
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        color: Color(0xFFeef0ff),
        fontWeight: FontWeight.bold
      ),
      labelSmall: TextStyle(
        fontSize: 15,
        color: Color(0xFF283044)
      )
    )
  );
}