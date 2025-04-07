import 'package:flutter/material.dart';
import 'dart:math';

class CircularProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = Colors.red.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final paintProgress = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // رسم القوس الخلفي
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      2 * pi,
      false,
      paintBackground,
    );

    // رسم القوس الأمامي
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi / 4, // تغيير القيمة لتحديد التقدم
      false,
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}