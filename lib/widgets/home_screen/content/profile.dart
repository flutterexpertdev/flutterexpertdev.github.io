import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/configs/asset_paths.dart';
import 'package:flutterexpertdev_github_io/configs/content.dart';
import 'package:flutterexpertdev_github_io/widgets/common/responsive_widget.dart';
import 'package:flutterexpertdev_github_io/widgets/home_screen/content/social.dart';
import 'package:gap/gap.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      left: _ProfileImage(),
      right: _ProfileText(),
      breakpoint: 680,
      horizontalSpacing: 64,
      verticalSpacing: 32,
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AssetPaths.profile),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _ProfileText extends StatelessWidget {
  const _ProfileText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Content.profile1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
        ),
        const Gap(8),
        Text(
          Content.profile2,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Theme.of(context).textTheme.headline4?.color,
              ),
        ),
        const Gap(16),
        const Social(size: 24),
      ],
    );
  }
}
