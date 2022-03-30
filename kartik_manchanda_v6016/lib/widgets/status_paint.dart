import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/Constants/colors.dart';

class StatusPainter extends CustomPainter {
  bool isSeen = false;
  int statusNum;
  StatusPainter({required this.isSeen, required this.statusNum});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isSeen ? ColorConstants.light_grey : ColorConstants.teal_green
      ..style = PaintingStyle.stroke;

    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(0), degreeToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusNum;

      for (int i = 0; i < statusNum; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

degreeToAngle(double degree) {
  return degree * pi / 180;
}
