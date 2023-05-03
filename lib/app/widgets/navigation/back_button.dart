import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shapes/roundedborder_with_icon.dart';

class AppBackButton extends StatelessWidget {
  final bool horizontalIcon;

  const AppBackButton({Key? key, required this.horizontalIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: RoundedBorderWithIcon(
          icon: horizontalIcon == true ? Icons.arrow_upward : Icons.arrow_back),
    );
  }
}
