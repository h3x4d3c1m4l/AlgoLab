import 'package:flutter/material.dart';

class CustomPaperGrid extends StatelessWidget {

  final Widget child;

  const CustomPaperGrid({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: const _CustomPaperGridPainter(), child: child);
  }

}

class _CustomPaperGridPainter extends CustomPainter {

  static const double d = 20;

  const _CustomPaperGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Paint blackPaint = Paint()..color = Colors.blueGrey.shade100..strokeWidth = 1;
    for (double y = 0; y <= size.height; y += d) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), blackPaint);
    }
    for (double x = 0; x <= size.width; x += d) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), blackPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
