import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class BadgedTitle extends StatelessWidget {
  final String title;
  final String number;
  final String color;
  const BadgedTitle(
      {Key? key,
      required this.title,
      required this.number,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title,
          style: GoogleFonts.lato(
              color: HexColor.fromHex("353645"),
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 0.5),
              ],
              fontSize: 16,
              fontWeight: FontWeight.w500)),
      AppSpaces.horizontalSpace10,
      Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8.0),
          decoration: BoxDecoration(
              border: Border.all(color: HexColor.fromHex(color), width: 1),
              borderRadius: BorderRadius.circular(50.0)),
          child: Text("$number members",
              style: GoogleFonts.lato(
                  color: HexColor.fromHex(color),
                  fontWeight: FontWeight.w700,
                  fontSize: 12)))
    ]);
  }
}
