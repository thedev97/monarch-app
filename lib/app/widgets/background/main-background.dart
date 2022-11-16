import 'package:flutter/material.dart';

import '../../core/values/values.dart';

// ignore: must_be_immutable
class MainBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(
    3,
        (index) => HexColor.fromHex("#ffffff"),
  );
  MainBackground({required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [...list, this.color],
                center: (position == "bottomRight")
                    ? Alignment(1.0, 1.0)
                    : Alignment(-1.0, -1.0),
              ),
            )));
  }
}

class DarkBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(
    3,
        (index) => Color(0xff202427),
  );
  DarkBackground({required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [...list, this.color],
                center: (position == "bottomRight")
                    ? Alignment(1.0, 1.0)
                    : Alignment(-1.0, -1.0),
              ),
            )));
  }
}