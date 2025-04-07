import 'package:flutter/material.dart';
import 'dart:math';

class RadarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.teal.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Paint sectorPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.teal.withOpacity(0.5),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ))
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // رسم الدوائر
    canvas.drawCircle(center, radius, circlePaint);
    canvas.drawCircle(center, radius * 0.7, circlePaint);
    canvas.drawCircle(center, radius * 0.4, circlePaint);

    // رسم القطاع
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 4,
      pi / 2,
      true,
      sectorPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}