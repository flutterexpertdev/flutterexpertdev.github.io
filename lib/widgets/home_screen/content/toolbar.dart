import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/configs/animation_constants.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:flutterexpertdev_github_io/widgets/common/animated_icon_button.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/link.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    required this.brightness,
    required this.onThemeToggled,
    required this.onLanguageToggled,
    Key? key,
  }) : super(key: key);

  final Brightness brightness;
  final VoidCallback onThemeToggled;
  final VoidCallback onLanguageToggled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const _HireMeButton(),
        const Gap(32),
        AnimatedIconButton(
          icon: brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
          onPressed: onThemeToggled,
        ),
        const Gap(16),
        // IconButton(
        //   onPressed: onLanguageToggled,
        //   icon: Text(
        //     AppLocalizations.of(context)!.localeName.toUpperCase(),
        //     style: const TextStyle(
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class _HireMeButton extends StatelessWidget {
  const _HireMeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(Content.contactLinks.first.url),
      builder: (context, onOpenLink) => ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          overlayColor: MaterialStateProperty.all(
            Theme.of(context).primaryColorDark,
          ),
          side: MaterialStateProperty.all(BorderSide.none),
          animationDuration: AnimationConstants.ms150,
        ),
        onPressed: onOpenLink,
        child: const Text(Content.hireMe),
      ),
    );
  }
}
