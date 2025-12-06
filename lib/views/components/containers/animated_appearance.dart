import 'package:flutter/material.dart';

class AnimatedAppearance extends StatefulWidget {

  final Widget child;

  const AnimatedAppearance({super.key, required this.child});

  @override
  State<AnimatedAppearance> createState() => _AnimatedAppearanceState();

}

class _AnimatedAppearanceState extends State<AnimatedAppearance> {

  CrossFadeState _state = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _state = CrossFadeState.showSecond);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const SizedBox(height: 0),
      secondChild: widget.child,
      crossFadeState: _state,
      duration: Duration(seconds: 1),
    );
  }

}
