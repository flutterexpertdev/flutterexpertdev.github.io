import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: const [
          _SummaryPoint(
            icon: Icons.work,
            title: '12',
            subtitle: 'Years',
          ),
          _SummaryPoint(
            icon: Icons.apps,
            title: '25+',
            subtitle: 'Apps',
          ),
          _SummaryPoint(
            icon: Icons.api,
            title: '15+',
            subtitle: 'Packages',
          ),
          _SummaryPoint(
            icon: MdiIcons.cat,
            title: '2',
            subtitle: 'Cats',
          ),
        ],
      ),
    );
  }
}

class _SummaryPoint extends StatelessWidget {
  const _SummaryPoint({
    required this.icon,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
          ),
          const Gap(4),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const Gap(4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
