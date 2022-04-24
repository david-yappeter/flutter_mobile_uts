import 'package:shared_preferences/shared_preferences.dart';

// Config untuk mengembalikan nilai 'theme_slug' dari local storage device (shared_preferences)
class DarkThemeConfig {
  static const themeSlug = "theme_slug";

// Meng-assign nilai dari perubahan dark theme ke dalam local storage
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeSlug, value);
  }

// Mengambil nilai dari darkTheme dari local storage
  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeSlug) ?? false;
  }
}
