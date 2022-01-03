import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/configs/animation_constants.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:flutterexpertdev_github_io/widgets/common/section.dart';
import 'package:gap/gap.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: Content.headerServices,
      content: LayoutBuilder(
        builder: (context, constraints) {
          const double spacing = 16;
          final availableSpace = constraints.maxWidth;

          bool hasSpaceForElements(int elements) =>
              availableSpace >= (_cardWidth * elements) + (spacing * (elements - 1) + 16 /*scrollbar = 16px*/);

          late int elementsPerRow;
          if (hasSpaceForElements(Content.services.length)) {
            elementsPerRow = 6;
          } else if (hasSpaceForElements(3)) {
            elementsPerRow = 3;
          } else if (hasSpaceForElements(2)) {
            elementsPerRow = 2;
          } else {
            elementsPerRow = 1;
          }

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < 6; i += elementsPerRow) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (var j = i; j < i + elementsPerRow; j++) ...[
                        _ServiceCard(
                          service: Content.services[j],
                        ),
                        if (j < i + elementsPerRow) const Gap(spacing),
                      ],
                    ],
                  ),
                  if (elementsPerRow != 6) const Gap(spacing),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

const double _cardWidth = 210;
const double _cardHeight = 140;

class _ServiceCard extends StatefulWidget {
  const _ServiceCard({
    required this.service,
    Key? key,
  }) : super(key: key);

  final ServiceModel service;

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: SizedBox(
        width: _cardWidth,
        height: _cardHeight,
        child: AnimatedContainer(
          duration: AnimationConstants.ms250,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          decoration: BoxDecoration(
            color: _isHovering ? Theme.of(context).colorScheme.primaryVariant : Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.service.icon,
                color: Colors.white,
              ),
              const Gap(8),
              Text(
                widget.service.text,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
