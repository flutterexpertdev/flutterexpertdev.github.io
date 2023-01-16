import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:flutterexpertdev_github_io/widgets/common/gradient_text.dart';
import 'package:flutterexpertdev_github_io/widgets/common/section.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/social.dart';
import 'package:gap/gap.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: Content.headerContact,
      content: Column(
        children: [
          GradientText(
            'Available now',
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(16),
          const Social(size: 64),
        ],
      ),
    );
  }
}
