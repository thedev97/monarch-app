import 'package:flutter/material.dart';
import '../../core/values/images.dart';

class AppSettingsIcon extends StatelessWidget {
  VoidCallback? callback;

  AppSettingsIcon({Key? key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Image.asset(
        menu_img,
        height: 30,
        width: 30,
      ),
    );
  }
}
