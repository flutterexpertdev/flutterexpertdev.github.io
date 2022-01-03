import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

typedef ResponsiveWidgetBuilder = Widget Function(bool isLandscape, double maxWidth);

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    this.left,
    this.leftBuilder,
    this.right,
    this.rightBuilder,
    required this.breakpoint,
    this.horizontalSpacing = 32,
    this.verticalSpacing = 32,
    this.leftCrossAxisAlignment = CrossAxisAlignment.center,
    Key? key,
  })  : assert(left != null || leftBuilder != null),
        assert(right != null || rightBuilder != null),
        assert(horizontalSpacing >= 0),
        assert(verticalSpacing >= 0),
        super(key: key);

  final Widget? left;
  final ResponsiveWidgetBuilder? leftBuilder;
  final Widget? right;
  final ResponsiveWidgetBuilder? rightBuilder;
  final double breakpoint;
  final double horizontalSpacing;
  final double verticalSpacing;
  final CrossAxisAlignment leftCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isLandscape = maxWidth > breakpoint;

        return isLandscape
            ? Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: leftCrossAxisAlignment,
                  children: [
                    left ?? leftBuilder!(isLandscape, maxWidth),
                    Gap(horizontalSpacing),
                    right ?? rightBuilder!(isLandscape, maxWidth),
                  ],
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  left ?? leftBuilder!(isLandscape, maxWidth),
                  Gap(verticalSpacing),
                  right ?? rightBuilder!(isLandscape, maxWidth),
                ],
              );
      },
    );
  }
}
