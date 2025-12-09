import 'package:flutter/material.dart';

class AnimatedAppearance extends StatefulWidget {

  final bool animateSize;
  final bool isDim;
  final Widget child;

  const AnimatedAppearance({super.key, required this.animateSize, required this.isDim, required this.child});

  @override
  State<AnimatedAppearance> createState() => _AnimatedAppearanceState();

}

class _AnimatedAppearanceState extends State<AnimatedAppearance> with TickerProviderStateMixin {

  late final AnimationController? _sizeAnimationController;
  late final Animation<double>? _sizeAnimation;

  late final AnimationController _fadeAnimationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  static const dimOpacity = 0.4;

  @override
  void initState() {
    if (widget.animateSize) {
      _sizeAnimationController =
          AnimationController(
              duration: const Duration(seconds: 1),
              vsync: this,
            )
            ..forward()
            ..addStatusListener((status) {
              if (status.isCompleted) _fadeAnimationController.animateTo(widget.isDim ? dimOpacity : 1.0);
            });

      _sizeAnimation = CurvedAnimation(parent: _sizeAnimationController!, curve: Curves.fastOutSlowIn);
    } else {
      _sizeAnimationController = null;
      _sizeAnimation = null;
      _fadeAnimationController.animateTo(widget.isDim ? dimOpacity : 1.0);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = FadeTransition(
      opacity: _fadeAnimationController,
      child: widget.child,
    );

    return MouseRegion(
      onEnter: widget.isDim ? (event) {
        _fadeAnimationController.animateTo(1.0);
      } : null,
      onExit: widget.isDim ? (event) {
        _fadeAnimationController.animateTo(dimOpacity);
      } : null,
      child: widget.animateSize ? SizeTransition(
        sizeFactor: _sizeAnimation!,
        child: child,
      ) : child,
    );
  }

  @override
  void dispose() {
    _sizeAnimationController?.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

}
