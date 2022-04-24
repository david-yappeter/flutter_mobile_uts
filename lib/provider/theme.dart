import 'package:flutter/material.dart';
import 'package:shoppp/theme/local.dart';

// Provider untuk mengakses nilai dark theme dari seluruh widget tree
class DarkThemeProvider with ChangeNotifier {
  DarkThemeConfig darkThemeConfig = DarkThemeConfig();
  bool _darkTheme = false;

  // getter dari darktheme
  bool get darkTheme => _darkTheme;

  /*
    setter dari darktheme
    beserta untuk meng-set nilai ke dalam local storage via 'DarkThemeConfig'
  */
  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemeConfig.setDarkTheme(value);
    notifyListeners();
  }
}
