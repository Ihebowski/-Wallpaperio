import 'package:flutter/material.dart';
import 'package:wallpaper_app/constants/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBackgroundColor,

    //TextTheme
    textTheme: const TextTheme(
      //Headline1
      headline1: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      //subtitle1
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      //subtitle2
      subtitle2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: accentColor,
      ),
      //Body1
      bodyText1: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      //button
      button: TextStyle(
        color: blackColor,
      ),
    ),

    //Other Colors
    primaryColor: blackColor,
    accentColor: lightBackgroundColor,
    backgroundColor: darkerLightBackgroundColor,

    //AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackgroundColor,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),

    //Snackbar
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: lightBackgroundColor,
      contentTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: lightTextColor,
      ),
      elevation: 0.0,
    ),

    //BottomNavigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightBackgroundColor,
      selectedItemColor: blackColor,
      unselectedItemColor: accentColor,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBackgroundColor,

    //TextTheme
    textTheme: const TextTheme(
      //Headline1
      headline1: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      //subtitle1
      subtitle1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      //subtitle2
      subtitle2: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: accentColor,
      ),
      //Body1
      bodyText1: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      button: TextStyle(
        color: whiteColor,
      ),
    ),

    //Other Colors
    primaryColor: whiteColor,
    accentColor: darkBackgroundColor,
    backgroundColor: lighterDarkBackgroundColor,

    //AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    //Snackbar
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: darkBackgroundColor,
      contentTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      elevation: 0.0,
    ),

    //BottomNavigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkBackgroundColor,
      selectedItemColor: whiteColor,
      unselectedItemColor: accentColor,
    ),
  );
}
