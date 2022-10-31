import 'package:flutter/material.dart';
import 'dart:math';

import '../../core/utils/extension.dart';

class CircleProgress extends CustomPainter {
  double currentProgress;

  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 5
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 5
      ..color = Color(0xff6CCC5B)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    double offset = completeArc.strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - completeArc.strokeWidth,
            size.height - completeArc.strokeWidth);
    completeArc.shader = SweepGradient(colors: [
      HexColor.fromHex("87EFB5"),
      HexColor.fromHex("8ABFFC"),
      HexColor.fromHex("EEB2E8"),
    ]).createShader(rect);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2.5 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
