import 'package:flutter/cupertino.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final String text;
  final Gradient gradient;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
