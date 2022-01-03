import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterexpertdev_github_io/configs/asset_paths.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:gap/gap.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).textTheme.bodyText2!.color!;
    final textColor = Theme.of(context).scaffoldBackgroundColor;

    final textStyle = TextStyle(
      color: textColor,
    );

    return CustomPaint(
      painter: _HorizontalOverflowPainter(
        color: backgroundColor,
        width: 8,
      ),
      child: ColoredBox(
        color: backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(32),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Content.footer,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: textColor,
                      ),
                ),
                SvgPicture.asset(
                  AssetPaths.flutter,
                  width: 16,
                  height: 16,
                ),
              ],
            ),
            const Gap(32),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Content.impressum,
                  style: textStyle,
                ),
                const Gap(16),
                Text(
                  Content.datenschutz,
                  style: textStyle,
                ),
              ],
            ),
            const Gap(16),
            Text(
              Content.copyright,
              style: textStyle.copyWith(
                fontSize: 10,
              ),
            ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}

class _HorizontalOverflowPainter extends CustomPainter {
  const _HorizontalOverflowPainter({
    required this.width,
    required this.color,
  });

  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final overflowSize = Size(
      width,
      size.height,
    );

    canvas.drawRect(
      Offset(-width, 0) & overflowSize,
      Paint()..color = color,
    );
    canvas.drawRect(
      Offset(size.width, 0) & overflowSize,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant _HorizontalOverflowPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.width != width;
}
