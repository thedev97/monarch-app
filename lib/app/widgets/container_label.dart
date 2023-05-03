import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/values/values.dart';

class ContainerLabel extends StatelessWidget {
  final String label;
  const ContainerLabel({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(label,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0.0, 0.5),
                      blurRadius: 0.2),
                ],
                color: Colors.black.withOpacity(0.6))));
  }
}
