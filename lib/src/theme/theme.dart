import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light

        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
        break;

      case 2: //light

        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
        break;

      case 3: //light

        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
    }
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));
    } else {
      _currentTheme = ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));;
    }
    notifyListeners();
  }

  set customTheme(value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xff48A0eB)),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: const Color(0xff16202b),
          textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Colors.pink),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.pink,
          ));
    } else {
      _currentTheme = ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.pink));;
    }
    notifyListeners();
  }
}
