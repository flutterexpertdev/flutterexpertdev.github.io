import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/about.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/contact.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/footer.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/profile.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/services.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/stories.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/summary.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/toolbar.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.brightness,
    required this.onThemeToggled,
    Key? key,
  }) : super(key: key);

  final Brightness brightness;
  final VoidCallback onThemeToggled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
        children: [
          Toolbar(
            brightness: brightness,
            onThemeToggled: onThemeToggled,
          ),
          const Gap(64),
          const Profile(),
          const Gap(64),
          const Services(),
          const Gap(64),
          const About(),
          const Gap(32),
          const Summary(),
          const Gap(80),
          const Stories(),
          const Gap(80),
          const Contact(),
          const Gap(96),
          const Footer(),
        ],
      ),
    );
  }
}
