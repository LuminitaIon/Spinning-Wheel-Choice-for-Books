import 'dart:math';

import 'package:flutter/material.dart';

class SpinPainter extends CustomPainter {
  final List<String> items;

  const SpinPainter({required this.items});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width * 0.7;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double angle = 2 * pi / items.length;

    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    for (int i = 0; i < items.length; i++) {
      final double startAngle = i * angle;
      final double endAngle = (i + 1) * angle;
      final Rect arcRect = Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius,
      );

      canvas.drawArc(
        arcRect,
        startAngle,
        endAngle - startAngle,
        true,
        paint,
      );

      TextSpan span = TextSpan(
        style: TextStyle(color: Colors.black,),
        text: items[i],
      );
      TextPainter tp = TextPainter(
        maxLines: 3,
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();

      // Calculate text position
      final double textAngle = (startAngle + endAngle) / 2;
      final double textRadius = radius - tp.height * 3; // Adjusted radius
      final double textX = centerX + textRadius * cos(textAngle);
      final double textY = centerY + textRadius * sin(textAngle);

      // Rotate canvas for text drawing
      canvas.save();
      canvas.translate(textX, textY);
      canvas.rotate(textAngle + pi / 32);
      tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
