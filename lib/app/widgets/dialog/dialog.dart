import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/values.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/core/values/sizes.dart';
import 'package:Monarch/app/widgets/buttons/primary_buttons.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String cancelButtonText;
  final String mainButtonText;

  CustomDialog(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.cancelButtonText,
      required this.mainButtonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: Text(
        title,
        textScaleFactor: 1.0,
        style: AppTextStyles.header3,
      ),
      content: Text(
        subtitle,
        textScaleFactor: 1.0,
        style: AppTextStyles.subHeader2,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: AppPrimaryButton(
            buttonText: mainButtonText,
            buttonHeight: 35,
            buttonWidth: sizeWidth * 0.3,
            callback: () => Get.back(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: AppPrimaryButton(
            buttonText: cancelButtonText,
            buttonHeight: 35,
            buttonWidth: sizeWidth * 0.3,
            callback: () => Get.back(),
          ),
        )
      ],
    );
  }
}
