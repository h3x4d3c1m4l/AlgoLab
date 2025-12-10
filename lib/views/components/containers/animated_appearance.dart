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

  bool _lastTapWasInside = false, _mousePointerInArea = false;

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

    if (_sizeAnimation != null) {
      child = SizeTransition(
        sizeFactor: _sizeAnimation,
        child: child,
      );
    }

    if (widget.isDim) {
      return TapRegion(
        onTapInside: (_) {
          _lastTapWasInside = true;
          animateOpacity();
        },
        onTapOutside: (_) {
          _lastTapWasInside = false;
          animateOpacity();
        },
        child: MouseRegion(
          onEnter: (event) {
            _mousePointerInArea = true;
            animateOpacity();
          },
          onExit: (event) {
            _mousePointerInArea = false;
            animateOpacity();
          },
          child: child,
        ),
      );
    }

    return child;
  }

  void animateOpacity() {
    if (_lastTapWasInside || _mousePointerInArea) {
      _fadeAnimationController.animateTo(1.0);
    } else {
      _fadeAnimationController.animateTo(dimOpacity);
    }
  }

  @override
  void dispose() {
    _sizeAnimationController?.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

}
