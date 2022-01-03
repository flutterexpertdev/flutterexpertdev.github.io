import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterexpertdev_github_io/configs/asset_paths.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:flutterexpertdev_github_io/extensions/list_widget_extensions.dart';
import 'package:flutterexpertdev_github_io/widgets/common/responsive_widget.dart';
import 'package:flutterexpertdev_github_io/widgets/common/section.dart';
import 'package:gap/gap.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const double _maxWidth = 400;

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: Content.headerAbout,
      content: ResponsiveWidget(
        left: const _Text(),
        rightBuilder: (isLandscape, _) => Padding(
          // HACK to improve layout
          padding: const EdgeInsets.only(top: 1.0),
          child: _Skills(
            maxWidth: isLandscape ? 250 : _maxWidth,
          ),
        ),
        breakpoint: 830,
        horizontalSpacing: 64,
        verticalSpacing: 32,
        leftCrossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: _maxWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final about in Content.about)
            Text(
              about,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
        ].intersperse(const Gap(6)),
      ),
    );
  }
}

class _Skills extends StatelessWidget {
  const _Skills({
    required this.maxWidth,
    Key? key,
  }) : super(key: key);

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = min(maxWidth, constraints.maxWidth);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Bar(
              icon: SvgPicture.asset(
                AssetPaths.flutter,
                width: 14,
                height: 14,
              ),
              title: 'Flutter',
              percentage: 1,
              maxWidth: width,
            ),
            _Bar(
              icon: const Icon(
                MdiIcons.appleIos,
                size: 16,
              ),
              title: 'iOS',
              percentage: 0.9,
              maxWidth: width,
            ),
            _Bar(
              icon: const Icon(
                Icons.android,
                size: 16,
                color: Color(0xffa4c639),
              ),
              title: 'Android',
              percentage: 0.8,
              maxWidth: width,
            ),
            _Bar(
              icon: SvgPicture.asset(
                AssetPaths.firebase,
                width: 16,
                height: 16,
              ),
              title: 'Firebase',
              percentage: 0.7,
              maxWidth: width,
            ),
            _Bar(
              icon: const Icon(
                MdiIcons.apple,
                size: 16,
              ),
              title: 'macOS',
              percentage: 0.6,
              maxWidth: width,
            ),
          ].intersperse(const Gap(16)),
        );
      },
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.icon,
    required this.title,
    required this.percentage,
    required this.maxWidth,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final double percentage;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const Gap(8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        const Gap(4),
        Container(
          height: 4,
          width: maxWidth * percentage,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
