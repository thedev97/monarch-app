import 'package:flutter/material.dart';
import '../../core/values/colors.dart';
import '../../core/values/values.dart';

class RoundedBorderWithIcon extends StatelessWidget {
  const RoundedBorderWithIcon(
      {Key? key, required this.icon, this.width, this.height})
      : super(key: key);
  final IconData icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 36,
        height: height ?? 36,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor, splashLinearColorOne],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(width: 1, color: primaryColor)),
        child: Center(child: Icon(icon, size: 18, color: Colors.white)));
  }
}
