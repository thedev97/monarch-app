import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final double buttonSize;
  final VoidCallback? callback;

  const AppTextButton(
      {Key? key,
      required this.buttonSize,
      required this.buttonText,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Text(buttonText,
          style: GoogleFonts.lato(shadows: [
            Shadow(
                color: Colors.black, offset: Offset(0.0, 1.0), blurRadius: 1.0),
          ], fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black)),
    );
  }
}
