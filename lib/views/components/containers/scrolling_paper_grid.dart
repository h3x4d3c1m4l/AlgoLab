import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ScrollingPaperGrid extends StatelessWidget {

  final double scrollOffset;
  final Widget? child;
  final bool animated;

  static const double cellDimension = 20;
  static final Color lineColor = Colors.blueGrey.shade50;
  static final double lineStrokeWidth = 1;

  const ScrollingPaperGrid({super.key, required this.scrollOffset, this.child}) : animated = false;
  const ScrollingPaperGrid.animated({super.key, this.child}) : animated = true, scrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    if (animated) {
      return LoopAnimationBuilder(
        tween: Tween<double>(begin: 0, end: cellDimension),
        duration: const Duration(seconds: 3),
        builder: (context, value, child) {
          return CustomPaint(
            painter: _CustomPaperGridPainter(
              cellDimension: cellDimension,
              horizontalOffset: value,
              verticalOffset: value,
              lineColor: lineColor,
              lineStrokeWidth: lineStrokeWidth,
            ),
            child: child,
          );
        },
      );
    }

    return CustomPaint(
      painter: _CustomPaperGridPainter(
        cellDimension: cellDimension,
        horizontalOffset: 0,
        verticalOffset: scrollOffset % cellDimension,
        lineColor: lineColor,
        lineStrokeWidth: lineStrokeWidth,
      ),
      child: child,
    );
  }

}

class _CustomPaperGridPainter extends CustomPainter {

  final double cellDimension;
  final double horizontalOffset;
  final double verticalOffset;
  final Color lineColor;
  final double lineStrokeWidth;

  const _CustomPaperGridPainter({
    required this.cellDimension,
    required this.horizontalOffset,
    required this.verticalOffset,
    required this.lineColor,
    required this.lineStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isInfinite) return;

    Paint blackPaint = Paint()..color = lineColor..strokeWidth = lineStrokeWidth;
    for (double y = verticalOffset; y <= size.height; y += cellDimension) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), blackPaint);
    }
    for (double x = horizontalOffset; x <= size.width; x += cellDimension) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), blackPaint);
    }
  }

  @override
  bool shouldRepaint(_CustomPaperGridPainter oldDelegate) => verticalOffset != oldDelegate.verticalOffset || horizontalOffset != oldDelegate.horizontalOffset;

}
