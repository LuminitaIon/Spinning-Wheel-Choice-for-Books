import 'package:flutter/material.dart';
import 'package:spinning_wheel/spin_painter.dart';

class SpinWheel extends StatelessWidget {
  final List<String> items;

  const SpinWheel({required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Container(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: SpinPainter(items: items),
        ),
      ),
    );
  }
}