import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppp/provider/theme.dart';
import 'package:shoppp/screens/settings.dart';
import 'package:shoppp/screens/shop_list.dart';
import 'package:shoppp/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemeConfig.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext ctx) => themeChangeProvider,
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder:
            (BuildContext context, DarkThemeProvider value, Widget? child) {
          return MaterialApp(
            title: 'My Shop',
            theme:
                ThemeStyles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: ShopListScreen.routeName,
            routes: {
              ShopListScreen.routeName: (BuildContext ctx) =>
                  const ShopListScreen(),
              SettingsScreen.routeName: (BuildContext ctx) =>
                  const SettingsScreen(),
            },
          );
        },
      ),
    );
  }
}
