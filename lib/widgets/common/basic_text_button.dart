import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BasicTextButton extends StatefulWidget {
  const BasicTextButton({
    required this.text,
    required this.textStyle,
    required this.url,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle textStyle;
  final String url;

  @override
  State<BasicTextButton> createState() => _BasicTextButtonState();
}

class _BasicTextButtonState extends State<BasicTextButton> with TickerProviderStateMixin {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrlString(widget.url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: Text(
          widget.text,
          style: widget.textStyle.copyWith(
            decoration: _isHovering ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }
}
