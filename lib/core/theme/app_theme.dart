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
      elevation: 2,
      iconTheme: IconThemeData(
        color: Color(0xFF474650),
      ),
    ),
    scaffoldBackgroundColor: Color(0xFFfcf8ff),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF3323cc),
      unselectedItemColor: Color(0xFF474650),
      type: BottomNavigationBarType.fixed,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF3323cc),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.light, 
      primary: Color(0xFF3525cd), 
      onPrimary: Color(0xFFffffff), 
      //secondary: Color(0xFF505f76), 
      secondary: Color(0xFFe4e1ee),
      onSecondary: Color(0xFFffffff), 
      error: Color(0xFFba1a1a), 
      onError: Color(0xFFffffff), 
      surface: Color(0xFFfcf8ff), 
      onSurface: Color(0xFF1b1b24),
      outline: Color(0xFF777587),
      tertiary: Color(0XFF7e3000),
      onTertiary: Color(0xFFffffff),
      primaryContainer: Color(0xFF4f46e5),
      onPrimaryContainer: Color(0xFFdad7ff),
      onTertiaryContainer: Color(0xFFffd2be),
      onSurfaceVariant: Color(0xFF464555),
      surfaceContainer: Color(0xFFe4e1ee),
      surfaceTint: Color(0xFF3525cd)
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        maximumSize: WidgetStatePropertyAll(
          Size(100, 130)
        )
      )
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

    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: BorderSide(
          color: Color(0xFF68788f)
        )
      )
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Color(0xFF68788f))
      )
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF3525cd),
        foregroundColor: Color(0xFFb7c8e1),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      )
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        )
      )
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: Color(0xFFe4e1ee),
      dayForegroundColor: WidgetStatePropertyAll(Color(0xFF1b1b24)),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Color(0xFF1b1b24)),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Color(0xFF1b1b24))
      ),
      yearForegroundColor: WidgetStatePropertyAll(Color(0xFF1b1b24)),
      headerForegroundColor: Color(0xFF1b1b24),
      subHeaderForegroundColor: Color(0xFF5f5d68)
    ),
    
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 19,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        color: Colors.black
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontSize: 19,
        color: Color(0xFFf3effc)
      ),
      displayMedium: TextStyle(
        fontSize: 17,
        color: Color(0xFFf3effc),
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        color: Color(0xFFf3effc),
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      headlineSmall: TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      labelLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      labelMedium: TextStyle(
        fontSize: 19,
        color: Color(0xFFf3effc),
        fontWeight: FontWeight.bold
      ),
      labelSmall: TextStyle(
        fontSize: 13,
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
    scaffoldBackgroundColor: Color(0xFF0F172A),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xFF7c87f3),
      unselectedItemColor: Color(0xFFbec6e0),
      type: BottomNavigationBarType.fixed,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFa0a3ff),
      foregroundColor: Color(0xFF0b1326),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50)
      ),
    ),

    colorScheme: ColorScheme(
      brightness: Brightness.dark, 
      primary: Color(0xFFc0c1ff), 
      onPrimary: Color(0xFF1000a9), 
      //secondary: Color(0xFFbdc2ff), 
      secondary: Color(0xFF283044),
      onSecondary: Color(0xFFbdc2ff), 
      error: Color(0xFFffb4ab), 
      onError: Color(0xFF690005), 
      surface: Color(0xFF0b1326), 
      onSurface: Color(0xFFdae2fd),
      outline: Color(0xFF908fa0),
      tertiary: Color(0xFFffb783),
      onTertiary: Color(0xFF4f2500),
      primaryContainer: Color(0xFF8083ff),
      onPrimaryContainer: Color(0xFF2d3449),
      onTertiaryContainer: Color(0xFF452000),
      onSurfaceVariant: Color(0xFFc7c4d7),
      surfaceContainer: Color(0xFF2d3449),
      surfaceTint: Color(0xFF283044)
    ),

    dividerTheme: DividerThemeData(
      color: Color(0xFF565e74),
      thickness: 1
    ),

    cardTheme: CardThemeData(
      color: Color(0xFF283044),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color(0xFF565e74)
        )
      )
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFc0c1ff),
        foregroundColor: Color(0xFF2d3449),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      )
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        )
      )
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: Color(0xFF283044),
      dayForegroundColor: WidgetStatePropertyAll(Color(0xFFeef0ff)),
      headerForegroundColor: Color(0xFFa3abc4),
      todayBackgroundColor: WidgetStatePropertyAll(Color(0xFFbdc2ff)),
      todayForegroundColor: WidgetStatePropertyAll(Color(0xFF1000a9)),
      yearForegroundColor: WidgetStatePropertyAll(Color(0xFFa3abc4)),
      rangePickerHeaderForegroundColor: Color(0xFFc0c1ff),
      rangeSelectionBackgroundColor: Color(0xFFa3abc4),
      headerHeadlineStyle: TextStyle(
        color: Colors.white
      ),
      weekdayStyle: TextStyle(
        color: Colors.white
      ),
      subHeaderForegroundColor: Color(0xFF283044),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Color(0xFFa3abc4))
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Color(0xFFa3abc4))
      )
    ),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.white)
      )
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
        fontSize: 19,
        color: Color(0xFFeef0ff),
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        color: Color(0xFFeef0ff)
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: Color(0xFFeef0ff),
      ),
      displayLarge: TextStyle(
        fontSize: 19,
        color: Color(0xFF283044)
      ),
      displayMedium: TextStyle(
        fontSize: 17,
        color: Color(0xFF283044),
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        color: Color(0xFF283044),
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
        fontSize: 15,
        color: Color(0xFFc0c1ff),
        fontWeight: FontWeight.bold
      ),
      labelLarge: TextStyle(
        fontSize: 30,
        color: Color(0xFFeef0ff),
        fontWeight: FontWeight.bold
      ),
      labelMedium: TextStyle(
        fontSize: 19,
        color: Color(0xFFa3abc4),
        fontWeight: FontWeight.bold
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        color: Color(0xFFa3abc4)
      )
    )
  );
}