import 'dart:math';

import 'package:flutter/material.dart';

class SpinPainter extends CustomPainter {
  final List<String> items;
  final List<Color> colors;
  final Color backgroundColor;
  final double angle;

  const SpinPainter({
    required this.items,
    required this.colors,
    required this.backgroundColor,
    required this.angle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width * 0.7;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double angle = 2 * pi / items.length;

    // Draw background color
    var backgroundPaint = Paint()..color = backgroundColor;
    canvas.drawCircle(Offset(centerX, centerY), radius, backgroundPaint);

    if (items.length == 1) {
      // Draw a full circle for a single item
      var fillPaint = Paint()
        ..color = colors[0].withOpacity(0.6)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(centerX, centerY), radius, fillPaint);

      // Draw text
      TextSpan span = TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        text: items[0],
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();

      // Calculate text position
      final double textX = centerX - tp.width / 2;
      final double textY = centerY - tp.height / 2;

      tp.paint(canvas, Offset(textX, textY));
    } else {
      for (int i = 0; i < items.length; i++) {
        double startAngle = angle;
        double endAngle = angle + 2 * pi / items.length;

        for (int i = 0; i < items.length; i++) {
          final Rect arcRect = Rect.fromCircle(
            center: Offset(centerX, centerY),
            radius: radius,
          );
        // Draw filled arc
        var fillPaint = Paint()
          ..color = colors[i].withOpacity(0.6)
          ..style = PaintingStyle.fill;
        canvas.drawArc(
          arcRect,
          startAngle,
          endAngle - startAngle,
          true,
          fillPaint,
        );

        // Draw border line
        var borderPaint = Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;
        canvas.drawArc(
          arcRect,
          startAngle,
          endAngle - startAngle,
          true,
          borderPaint,
        );

        // Draw text
        TextSpan span = TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          text: items[i],
        );
        TextPainter tp = TextPainter(
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
          // Rotate canvas for text drawing
          tp.paint(canvas, Offset(textX, textY));

          startAngle = endAngle;
          endAngle += 2 * pi / items.length;
      }
    }
  }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
