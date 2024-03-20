import 'package:control/half_circular_progress_painter.dart';
import 'package:flutter/material.dart';

class HalfCircularProgress extends StatefulWidget {
  final double progress;
  final double maxProgress;
  final ValueChanged<double> onMaxProgressChanged;
  final Color color;
  final Color arcColor;

  const HalfCircularProgress({
    super.key,
    required this.progress,
    required this.maxProgress,
    required this.onMaxProgressChanged,
    required this.color,
    required this.arcColor,
  });

  @override
  State<HalfCircularProgress> createState() => _HalfCircularProgressState();
}

class _HalfCircularProgressState extends State<HalfCircularProgress> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: CustomPaint(
        size: const Size(250, 250),
        painter: HalfCircularProgressPainter(
          color: widget.color,
          arcColor: widget.arcColor,
          maxProgress: widget.maxProgress,
          progress: widget.progress,
          onMaxProgressChanged: (value) {
            widget.onMaxProgressChanged(value);
          },
          onPositionRendexBox: (value) {},
        ),
      ),
    );
  }
}
