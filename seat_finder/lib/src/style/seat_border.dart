import 'package:flutter/material.dart';
import 'package:seat_finder/src/model/seat_model.dart';
import 'palette.dart';

class SeatBorder extends CustomPainter {
  SeatBorder({required this.radius, required this.type});
  final double radius;
  final BorderType type;
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final Paint paint = Paint()..color = Palette.blue;
    final Radius borderRadius = Radius.circular(radius);

    if (type.isTop()) {
      canvas.drawRRect(
          RRect.fromLTRBAndCorners(
              rect.left - radius / 2,
              rect.top - radius / 2,
              rect.right + radius / 2,
              rect.top + radius / 2,
              topLeft: borderRadius,
              topRight: borderRadius),
          paint);

      canvas.drawRRect(
          RRect.fromLTRBAndCorners(rect.left - radius / 2, rect.top,
              rect.left + radius / 2, rect.bottom / 2 + radius / 2,
              topLeft: borderRadius,
              bottomLeft: borderRadius,
              bottomRight: borderRadius),
          paint);

      canvas.drawRRect(
          RRect.fromLTRBAndCorners(rect.right - radius / 2, rect.top,
              rect.right + radius / 2, rect.bottom / 2 + radius / 2,
              topRight: borderRadius,
              bottomLeft: borderRadius,
              bottomRight: borderRadius),
          paint);
    } else {
      canvas.drawRRect(
          RRect.fromLTRBAndCorners(
              rect.left - radius / 2,
              rect.bottom - radius / 2,
              rect.right + radius / 2,
              rect.bottom + radius / 2,
              bottomLeft: borderRadius,
              bottomRight: borderRadius),
          paint);

      canvas.drawRRect(
          RRect.fromLTRBAndCorners(rect.left - radius / 2,
              rect.bottom / 2 - radius / 2, rect.left + radius / 2, rect.bottom,
              topLeft: borderRadius,
              topRight: borderRadius,
              bottomLeft: borderRadius),
          paint);

      canvas.drawRRect(
          RRect.fromLTRBAndCorners(
              rect.right - radius / 2,
              rect.bottom / 2 - radius / 2,
              rect.right + radius / 2,
              rect.bottom,
              topLeft: borderRadius,
              topRight: borderRadius,
              bottomRight: borderRadius),
          paint);
    }
  }

  @override
  bool shouldRepaint(SeatBorder oldDelegate) => false;
}
