import 'package:flutter/material.dart';
import 'package:Monarch/app/core/values/values.dart';

enum ProfileTypeImg { Icon, Image, Button }

class ProfileImg extends StatelessWidget {
  final Widget imgContainer;
  final Widget buttonContainer;

  ProfileImg(
      {Key? key, required this.imgContainer, required this.buttonContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imgContainer,
        AppSpaces.verticalSpace15,
        buttonContainer,
      ],
    );
  }
}

