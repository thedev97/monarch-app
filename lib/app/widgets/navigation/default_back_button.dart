import 'package:Monarch/app/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shapes/default_back.dart';

class DefaultBack extends StatelessWidget {
  const DefaultBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: DefaultBackWithIcon(img: back_img));
  }
}
