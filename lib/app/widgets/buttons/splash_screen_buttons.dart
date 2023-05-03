import 'package:flutter/material.dart';
import 'package:project_management_tool/app/core/values/images.dart';
import 'package:project_management_tool/app/core/values/values.dart';

enum SplashButtonSizes { small, medium, large }

class SplashButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;

  final VoidCallback? callback;

  const SplashButton(
      {Key? key,
      this.callback,
      required this.buttonHeight,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyles.primaryDecoration,
          child: Image.asset(arrowImg)),
    );
  }
}
