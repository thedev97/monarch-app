import 'package:flutter/material.dart';
import 'package:Monarch/app/core/values/values.dart';

enum PrimaryButtonSizes { small, medium, large }

class CircularButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;

  final String buttonText;
  final VoidCallback? callback;

  const CircularButton(
      {Key? key,
      this.callback,
      required this.buttonText,
      required this.buttonHeight,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyles.circleRounded,
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          )),
    );
  }
}
