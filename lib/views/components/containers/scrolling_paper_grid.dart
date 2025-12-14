import 'package:flutter/material.dart';

class ScrollingPaperGrid extends StatelessWidget {

  final double scrollOffset;
  final Widget? child;

  static const double cellDimension = 20;
  static final Color lineColor = Colors.blueGrey.shade50;
  static final double lineStrokeWidth = 1;

  const ScrollingPaperGrid({super.key, required this.scrollOffset, this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomPaperGridPainter(
        cellDimension: cellDimension,
        offset: scrollOffset % cellDimension,
        lineColor: lineColor,
        lineStrokeWidth: lineStrokeWidth,
      ),
      child: child,
    );
  }

}

class _CustomPaperGridPainter extends CustomPainter {

  final double cellDimension;
  final double offset;
  final Color lineColor;
  final double lineStrokeWidth;

  const _CustomPaperGridPainter({required this.cellDimension, required this.offset, required this.lineColor, required this.lineStrokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isInfinite) return;

    Paint blackPaint = Paint()..color = lineColor..strokeWidth = lineStrokeWidth;
    for (double y = offset; y <= size.height; y += cellDimension) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), blackPaint);
    }
    for (double x = 0; x <= size.width; x += cellDimension) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), blackPaint);
    }
  }

  @override
  bool shouldRepaint(_CustomPaperGridPainter oldDelegate) => offset != oldDelegate.offset;

}
