import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:flutterexpertdev_github_io/extensions/list_widget_extensions.dart';
import 'package:flutterexpertdev_github_io/widgets/common/section.dart';
import 'package:gap/gap.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: Content.headerSuccessStories,
      content: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          for (final story in Content.successStories) _Story(text: story),
        ],
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondary.withOpacity(0.75),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const Gap(16),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < 5; i++)
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
              ].intersperse(const Gap(4)),
            ),
          ),
        ],
      ),
    );
  }
}
