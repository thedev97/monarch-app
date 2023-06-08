import 'package:flutter/material.dart';

class DefaultBackWithIcon extends StatelessWidget {
  const DefaultBackWithIcon(
      {Key? key, required this.img})
      : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Image.asset(img, height: 22, width : 22);
  }
}