import 'package:flutter/material.dart';

class AnimatedAppearance extends StatefulWidget {

  final Widget child;

  const AnimatedAppearance({super.key, required this.child});

  @override
  State<AnimatedAppearance> createState() => _AnimatedAppearanceState();

}

class _AnimatedAppearanceState extends State<AnimatedAppearance> with TickerProviderStateMixin {

  late final AnimationController _sizeAnimationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward()..addStatusListener((status) {
    if (status.isCompleted) _fadeAnimationController.forward();
  });
  late final Animation<double> _sizeAnimation = CurvedAnimation(
    parent: _sizeAnimationController,
    curve: Curves.fastOutSlowIn,
  );

  late final AnimationController _fadeAnimationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _fadeAnimationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _sizeAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _sizeAnimationController.dispose();
    super.dispose();
  }

}
