import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _themeMode = ThemeMode.system;
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: FlexThemeData.light(
        scheme: FlexScheme.indigo,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepBlue,
      ),
      themeMode: _themeMode,
      builder: (context, child) => HomeScreen(
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
        onLanguageToggled: () => setState(() {
          final currentLocale = Localizations.localeOf(context);
          _locale = AppLocalizations.supportedLocales.firstWhere((locale) => locale != currentLocale);
        }),
      ),
    );
  }
}
