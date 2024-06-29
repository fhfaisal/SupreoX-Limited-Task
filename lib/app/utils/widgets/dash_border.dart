import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final double borderRadius;

  DottedBorderPainter({this.borderRadius = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffFF6B23)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final double dashWidth = 3; // Width of each dash
    final double dashSpace = 2; // Space between each dash

    // Create a rounded rectangle path
    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    // Create a path from the rounded rectangle
    final Path path = Path()..addRRect(rrect);

    // Extract the path's metrics to be able to draw dashed lines
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final double nextDistance = distance + dashWidth;
        final Path extractPath = pathMetric.extractPath(
          distance,
          nextDistance,
        );
        canvas.drawPath(extractPath, paint);
        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double borderRadius;

  DottedBorderContainer({
    required this.child,
    required this.backgroundColor,
    this.borderRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: DottedBorderPainter(borderRadius: borderRadius),
          ),
        ),
      ],
    );
  }
}