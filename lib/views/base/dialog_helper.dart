import 'dart:ui';
import 'package:flutter/material.dart';

Future<T?> showAlgoLabDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  bool blurBackground = true,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: 'Dismiss',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) => Builder(builder: builder),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          // Animated blurred backdrop.
          if (blurBackground)
            IgnorePointer( // For some reason this fixes the barrier dismission...
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5 * animation.value, sigmaY: 5 * animation.value),
                    child: Container(color: Colors.black.withValues(alpha: 0.3 * animation.value)),
                  );
                },
              ),
            ),
          // Dialog content with fade and scale.
          Center(
            child: FadeTransition(
              opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutCirc, reverseCurve: Curves.easeInQuint),
              child: ScaleTransition(
                scale: CurvedAnimation(parent: animation, curve: Curves.elasticOut, reverseCurve: Curves.easeOutQuint),
                child: child,
              ),
            ),
          ),
        ],
      );
    },
  );
}
