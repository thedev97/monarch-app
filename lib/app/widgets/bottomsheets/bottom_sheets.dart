import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/values.dart';
import 'project_detail_sheet.dart';

showSettingsBottomSheet() => showAppBottomSheet(ProjectDetailBottomSheet());

showAppBottomSheet(Widget widget, {bool isScrollControlled = false, bool popAndShow = false, double? height}) {
  if (popAndShow) Get.back();
  return Get.bottomSheet(height == null ? widget : Container(height: height, child: widget),
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: isScrollControlled);
}
