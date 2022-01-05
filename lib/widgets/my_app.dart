import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.indigo,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepBlue,
      ),
      themeMode: _themeMode,
      builder: (context, child) => HomeScreen(
        brightness: _themeMode.effectiveBrightness(context),
        onThemeToggled: () => setState(() {
          if (_themeMode == ThemeMode.system) {
            if (MediaQuery.of(context).platformBrightness == Brightness.light) {
              _themeMode = ThemeMode.dark;
            } else {
              _themeMode = ThemeMode.light;
            }
          } else {
            _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          }
        }),
      ),
    );
  }
}

extension on ThemeMode {
  Brightness effectiveBrightness(BuildContext context) {
    switch (this) {
      case ThemeMode.light:
        return Brightness.light;
      case ThemeMode.dark:
        return Brightness.dark;
      case ThemeMode.system:
        return MediaQuery.of(context).platformBrightness;
    }
  }
}
