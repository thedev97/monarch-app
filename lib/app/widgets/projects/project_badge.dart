import 'package:flutter/material.dart';
import '../../core/values/values.dart';

class ColouredProjectBadge extends StatelessWidget {
  const ColouredProjectBadge({
    Key? key,
    required this.color,
    required this.category,
  }) : super(key: key);

  final String color;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HexColor.fromHex(color)),
        child: Icon(Icons.bookmarks,
            size: 20,
            color: (category == "Development" ? Colors.black : Colors.white)));
  }
}
