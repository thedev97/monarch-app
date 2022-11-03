import 'package:flutter/material.dart';
import '../../core/values/values.dart';

class GreenDoneIcon extends StatelessWidget {
  const GreenDoneIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: HexColor.fromHex("FDA7FF")),
          child: Icon(Icons.done, color: Colors.white, size: 20,)),
    );
  }
}
