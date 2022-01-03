import 'package:flutter/material.dart';
import 'package:flutterexpertdev_github_io/configs/animation_constants.dart';

class AnimatedIconButton extends StatefulWidget {
  const AnimatedIconButton({
    required this.icon,
    this.size,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final double? size;
  final VoidCallback onPressed;

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AnimationConstants.ms150,
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _colorAnimation = ColorTween(
      begin: Theme.of(context).iconTheme.color,
      end: Theme.of(context).colorScheme.primary,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => _controller.forward(),
        onExit: (_) => _controller.reverse(),
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (_, __) => Icon(
            widget.icon,
            size: widget.size,
            color: _colorAnimation.value,
          ),
        ),
      ),
    );
  }
}
