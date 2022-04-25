import 'package:flutter/material.dart';

class ThemeStyles {
  /*
    mengembalikan theme sesuai nilai 'isDarkTheme' yang di passing
  */
  static ThemeData themeData(bool isDarkTheme, BuildContext ctx) {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: isDarkTheme ? Colors.grey[900] : Colors.green[600],
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: isDarkTheme ? Colors.green[600] : Colors.green[600],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: isDarkTheme ? Colors.grey[900] : Colors.green[600],
        textTheme: ButtonTextTheme.primary,
      ),
      hoverColor: isDarkTheme ? Colors.grey[900] : Colors.green[600],
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: isDarkTheme
              ? MaterialStateProperty.all<Color>(Colors.white)
              : MaterialStateProperty.all<Color>(Colors.black),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: isDarkTheme
              ? MaterialStateProperty.all<Color>(Colors.grey[600] as Color)
              : MaterialStateProperty.all<Color>(Colors.green),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.grey[900] : Colors.green[600],
        foregroundColor: Colors.white,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDarkTheme ? Colors.grey[900] : Colors.green[600],
        contentTextStyle: const TextStyle(
          color: Colors.white,
        ),
        actionTextColor: Colors.white,
      ),
    );
  }
}
