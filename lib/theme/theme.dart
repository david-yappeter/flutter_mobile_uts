import 'package:flutter/material.dart';

class ThemeStyles {
  /*
    mengembalikan theme sesuai nilai 'isDarkTheme' yang di passing
  */
  static ThemeData themeData(bool isDarkTheme, BuildContext ctx) {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: isDarkTheme ? Colors.grey[900] : Colors.green,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: isDarkTheme ? Colors.green : Colors.green,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: isDarkTheme ? Colors.grey[900] : Colors.green,
        textTheme: ButtonTextTheme.primary,
      ),
      hoverColor: isDarkTheme ? Colors.grey[900] : Colors.green,
    );
  }
}
