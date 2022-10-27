import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/icons.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Color(0xff122037),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0)),
          child: Icon(
            backIcon,
            color: Colors.white,
          )),
    );
  }
}
