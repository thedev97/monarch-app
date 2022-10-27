import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class PrimaryProgressButton extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final VoidCallback? callback;
  const PrimaryProgressButton({
    Key? key,
    required this.label,
    this.callback,
    this.width,
    this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 130,
      height: height ?? 60,
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyles.blueRounded,
          child: Text(label,
              style: textStyle ??
                  GoogleFonts.lato(
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0),
                      ],
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white))),
    );
  }
}
