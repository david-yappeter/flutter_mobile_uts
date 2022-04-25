import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppp/provider/theme.dart';
import 'package:shoppp/widgets/drawer.dart';

/*
  Screen Setting untuk Darkmode menggunakan stateless widget
  Mengambil nilai darkMode dari Provider dan mengset dengan provider juga
*/
class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const CustomDrawer(),
      body: Row(
        children: [
          Switch(
            value: isDarkMode,
            onChanged: (bool? val) {
              Provider.of<DarkThemeProvider>(context, listen: false).darkTheme =
                  val as bool;
            },
          ),
          Text('Dark Mode: ${isDarkMode ? "ON" : "OFF"}'),
        ],
      ),
    );
  }
}
