import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/values.dart';

class InBottomSheetSubtitle extends StatelessWidget {
  final String title;
  final Alignment? alignment;
  final TextStyle? textStyle;

  const InBottomSheetSubtitle({
    required this.title,
    Key? key,
    this.alignment,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.centerLeft,
      child: Text(title,
          textAlign: TextAlign.justify,
          style: textStyle ??
              GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                  fontSize: 12, color: HexColor.fromHex("626777"))),
    );
  }
}
