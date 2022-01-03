import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:flutterexpertdev_github_io/widgets/common/animated_icon_button.dart';
import 'package:url_launcher/link.dart';

class Social extends StatelessWidget {
  const Social({
    required this.size,
    Key? key,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final contact in Content.contactLinks)
            _ContactButton(
              contact: contact,
              size: size,
            ),
        ],
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.contact,
    required this.size,
    Key? key,
  }) : super(key: key);

  final ContantModel contact;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(contact.url),
      target: LinkTarget.blank,
      builder: (context, onOpenLink) => AnimatedIconButton(
        icon: contact.icon,
        size: size,
        onPressed: () => onOpenLink?.call(),
      ),
    );
  }
}
