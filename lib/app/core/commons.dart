import 'package:flutter/material.dart';
import 'package:project_management_tool/app/core/utils/extension.dart';
import 'package:project_management_tool/app/core/values/images.dart';

class Commons {
  static const lightThemeLightShadowColor = Color(0xffCECECE);
  static const baseRadius = 12.0;
  static const baseMargin = 8.0;
  static const smallBaseRadius = 8.0;
  static const bigBaseRadius = 16.0;
  static const baseIconSize = 24.0;
  static const arrowDownButtonHeight = 25.0;
  static const buttonHeight = 50.0;
  static const buttonShortHeight = 40.0;
  static BorderRadius borderRadius = BorderRadius.circular(baseRadius);
  static BorderRadius smallBorderRadius =
  BorderRadius.circular(smallBaseRadius);
  static BorderRadius bigBorderRadius = BorderRadius.circular(bigBaseRadius);

  static BoxShadow shadow() {
    return BoxShadow(
      blurRadius: 10,
      color: lightThemeLightShadowColor,
      offset: const Offset(0, 4),
    );
  }

  static AppBar appBar(
    BuildContext context, {
    String? label,
    String? taskLabel,
    Widget? leading,
    List<Widget>? actions,
  }) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: leading,
      title: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: Row(
          children: [
            /*Container(
              height: 45,
              width: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  profileImg,
                ),
              ),
            ),*/
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label ?? "",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 13.0),
                ),
                verticalSpaceTiny,
                Text(
                  taskLabel ?? "",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14.0.sp),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }

  static bool isBottom(
    ScrollController scrollController, [
    double scrollOffsetThreshold = 0.7,
  ]) {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;

    return currentScroll >= (maxScroll * scrollOffsetThreshold) &&
        currentScroll > 0;
  }
}

const baseMargin = 8.0;

//* Horizontal Spacing
const Widget horizontalSpaceTiny = SizedBox(width: baseMargin / 2);
const Widget horizontalSpaceSmall = SizedBox(width: baseMargin);
const Widget horizontalSpaceRegular = SizedBox(width: baseMargin * 2);
const Widget horizontalSpaceMedium = SizedBox(width: baseMargin * 3);
const Widget horizontalSpaceLarge = SizedBox(width: baseMargin * 4);
const Widget bundleHorizontalSpacing = SizedBox(width: baseMargin * 1.5);

//* Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(height: baseMargin / 2);
const Widget verticalSpaceSmall = SizedBox(height: baseMargin);
const Widget verticalSpaceRegular = SizedBox(height: baseMargin * 2);
const Widget verticalSpaceMedium = SizedBox(height: baseMargin * 4);
const Widget verticalSpaceLarge = SizedBox(height: baseMargin * 8);
const Widget verticalSpaceExtraLarge = SizedBox(height: baseMargin * 10);
const Widget verticalLargeSpace = SizedBox(height: baseMargin * 15);
const Widget bundleVerticalSpacing = SizedBox(height: baseMargin * 1.5);




