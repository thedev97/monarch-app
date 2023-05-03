import 'package:flutter/material.dart';
import '../values/colors.dart';

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = primaryColor;
    Path path = new Path();
    path.lineTo(0, size.height - size.height / 1.6);
    //Use the method conicTo
    path.conicTo(size.width / 0.2, size.height, size.width,
        size.height - size.height / 5, 15);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = whiteColor;
    var path = Path();
    path.lineTo(0, size.height - size.height / 3.5);
    path.lineTo(size.width / 1.2, size.height / 1.05);
    //Added this line
    path.relativeQuadraticBezierTo(30, 20, 50, -5);
    path.lineTo(size.width, size.height - size.height / 5);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PainterThree extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = whiteColor;
    var path = Path();
    path.lineTo(0, size.height);

    path.lineTo(size.width / 1, size.height);
    //Added this line
    path.lineTo(size.height, size.width);
    path.lineTo(size.width, 250);
    path.relativeQuadraticBezierTo(20, 60, 100, -50);
    path.conicTo(75, 20, 20, -10, 20);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
