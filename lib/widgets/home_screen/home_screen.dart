import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.onThemeToggled,
    required this.onLanguageToggled,
    Key? key,
  }) : super(key: key);

  final VoidCallback onThemeToggled;
  final VoidCallback onLanguageToggled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onThemeToggled,
                icon: Icon(
                  MediaQuery.of(context).platformBrightness == Brightness.light ? Icons.dark_mode : Icons.light_mode,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: onLanguageToggled,
                icon: Text(
                  AppLocalizations.of(context)!.localeName.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(AppLocalizations.of(context)!.test),
          ),
        ],
      ),
    );
  }
}
