import 'package:flutter/material.dart';
import 'dart:math';


class StepsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final paintBackground = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      paintBackground,
    );

    // رسم القوس الأمامي
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi / 2, // يمكنك تعديل هذه القيمة لتغيير التقدم
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}