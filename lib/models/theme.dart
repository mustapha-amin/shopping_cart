import 'package:flutter/material.dart';

class MyThemes {
  static final darktheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.red),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
    ),
  );
}
