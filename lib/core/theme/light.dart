import 'package:flutter/material.dart';
//0xFF0078ff
ThemeData light({Color color =  Colors.teal}) => ThemeData(
      // useMaterial3: false, // Uncomment if necessary
      // fontFamily: AppConstants.fontFamily,
      primaryColor: color,
      hoverColor: const Color(0xFF000000),
      secondaryHeaderColor: const Color(0xFF102e52),
      disabledColor: const Color(0xFFf3f3f3),
      brightness: Brightness.light,
      hintColor: const Color(0xFF9F9F9F),
      cardColor: Colors.white,
      scaffoldBackgroundColor:
          const Color(0xFFf4f4f4), // Changed to scaffoldBackgroundColor
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
      colorScheme: ColorScheme.light(primary: color, secondary: color)
          .copyWith(surface: const Color(0xFFFCFCFC))
          .copyWith(error: const Color(0xFFE84D4F)),
    );
