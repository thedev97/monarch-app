import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/core/values/values.dart';

import '../../core/values/colors.dart';

enum PrimaryButtonSizes { small, medium, large }

class AppPrimaryButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;

  final String buttonText;
  final VoidCallback? callback;

  const AppPrimaryButton(
      {Key? key,
      this.callback,
      required this.buttonText,
      required this.buttonHeight,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          gradient: LinearGradient(
              colors: [primaryColor, splashLinearColorOne],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyles.blueRounded,
          child: Text(buttonText,
              style: GoogleFonts.lato(
                  fontSize: buttonText == "Invite" ? 10 : 13,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0),
                  ],
                  fontWeight: FontWeight.w500,
                  color: Colors.white))),
    );
  }
}
