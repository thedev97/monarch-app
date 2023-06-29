import 'values/colors.dart';
import 'values/images.dart';
import 'values/sizes.dart';
import 'values/values.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../widgets/listviews/plan-info.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/buttons/primary_buttons.dart';
import 'package:Monarch/app/core/utils/extension.dart';
import 'package:Monarch/app/core/values/strings.dart';

class Commons {
  static const baseRadius = 12.0;
  static const smallBaseRadius = 8.0;
  static const bigBaseRadius = 16.0;
  static BorderRadius borderRadius = BorderRadius.circular(baseRadius);
  static BorderRadius smallBorderRadius =
  BorderRadius.circular(smallBaseRadius);
  static BorderRadius bigBorderRadius = BorderRadius.circular(bigBaseRadius);

  static successSnackBar(title, msg){
    return Get.snackbar(title, msg,
        titleText: Text(
          title,
          style: AppTextStyles.highlightText,
        ),
        backgroundColor: Colors.green.withOpacity(0.6),
        messageText: Text(
          msg,
          style: AppTextStyles.highlightText,
        ));
  }

  static errorSnackBar(title, msg){
    return Get.snackbar(title, msg,
        titleText: Text(
          title,
          style: AppTextStyles.highlightText,
        ),
        backgroundColor: Colors.red.withOpacity(0.6),
        messageText: Text(
          msg,
          style: AppTextStyles.highlightText,
        ));
  }

  static Future planDetails(
      String plan,
      String days,
      String amount,
      String checkImg,
      String uncheckImg,
      String details_one,
      String details_two,
      String details_three,
      String details_four,
      String details_five) {
    return Get.defaultDialog(
      barrierDismissible: true,
      title: '',
      content: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(plan_img, height: 60, width: 60),
                        Column(
                          children: [
                            DefaultTextStyle(
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 1.0),
                                  ],
                                  color: Colors.black),
                              child: Text(plan),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 30.0,
                                  top: 5.0,
                                  right: 30.0,
                                  bottom: 30.0),
                              child: DefaultTextStyle(
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.8)),
                                child: Text(days),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white, width: 1)),
                        child: Icon(
                          Icons.close_sharp,
                          size: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              PlanInfoViews(
                title: details_one,
                image: checkImg,
              ),
              SizedBox(
                height: 10,
              ),
              PlanInfoViews(
                title: details_two,
                image: checkImg,
              ),
              SizedBox(
                height: 10,
              ),
              PlanInfoViews(
                title: details_three,
                image: plan == 'Basic Plan' ? uncheckImg : checkImg,
              ),
              SizedBox(
                height: 10,
              ),
              PlanInfoViews(
                title: details_four,
                image: plan == 'Basic Plan' || plan == 'Standard'
                    ? uncheckImg
                    : checkImg,
              ),
              SizedBox(
                height: 10,
              ),
              PlanInfoViews(
                title: details_five,
                image: plan != 'Platinum' ? uncheckImg : checkImg,
              ),
              SizedBox(
                height: 30,
              ),
              AppPrimaryButton(
                  buttonHeight: 40,
                  buttonWidth: sizeWidth * 0.7,
                  buttonText: choose_plan_button,
                  callback: () => Get.back()),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
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
}

const baseMargin = 8.0;

//* Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(height: baseMargin / 2);
const Widget verticalSpaceSmall = SizedBox(height: baseMargin);
const Widget verticalSpaceRegular = SizedBox(height: baseMargin * 2);
const Widget verticalSpaceMedium = SizedBox(height: baseMargin * 4);
const Widget verticalSpaceExtraLarge = SizedBox(height: baseMargin * 10);
const Widget verticalLargeSpace = SizedBox(height: baseMargin * 15);





