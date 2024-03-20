import 'package:flutter/material.dart';
import 'dart:math';

class HalfCircularProgressPainter extends CustomPainter {
  final double progress;
  final double maxProgress;
  final ValueChanged<double> onMaxProgressChanged;
  final ValueChanged<double> onPositionRendexBox;
  final Color color;
  final Color arcColor;

  HalfCircularProgressPainter({
    
    required this.progress,
    required this.maxProgress,
    required this.onMaxProgressChanged,
    required this.onPositionRendexBox,
    required this.color,
    required this.arcColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    const startAngle = pi / 1.35;
    const sweepAngle = 3 * pi / 2;
    final double progressAngle = sweepAngle * progress;
    final double maxProgressAngle = sweepAngle * maxProgress;
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    final progressRect = RRect.fromRectAndCorners(
      Rect.fromCircle(center: center, radius: radius),
      topLeft: const Radius.circular(12.0),
      topRight: const Radius.circular(12.0),
      bottomLeft: const Radius.circular(12.0),
      bottomRight: const Radius.circular(12.0),
    );
    canvas.drawArc(
      progressRect.outerRect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    final progressRect2 = RRect.fromRectAndCorners(
      Rect.fromCircle(center: center, radius: radius),
      topLeft: const Radius.circular(12.0),
      topRight: const Radius.circular(12.0),
      bottomLeft: const Radius.circular(12.0),
      bottomRight: const Radius.circular(12.0),
    );
    canvas.drawArc(
      progressRect2.outerRect,
      startAngle,
      progressAngle,
      false,
      progressPaint,
    );
    final maxProgressPaint = Paint()
      ..color = arcColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
    final maxProgressPoint = Offset(
      center.dx + radius * cos(startAngle + maxProgressAngle + 0.05),
      center.dy + radius * sin(startAngle + maxProgressAngle + 0.05),
    );
    canvas.drawCircle(maxProgressPoint, 9.0, maxProgressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
