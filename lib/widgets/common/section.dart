import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        const Gap(16),
        content,
      ],
    );
  }
}
