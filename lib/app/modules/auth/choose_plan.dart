import 'new_workspace.dart';
import 'package:get/get.dart';
import '../../core/commons.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../core/utils/custom-painter.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/listviews/plan-info.dart';
import '../../widgets/navigation/back_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/widgets/listviews/custom-list.dart';
import 'package:Monarch/app/widgets/listviews/select-views.dart';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({Key? key}) : super(key: key);

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  bool isSelectFreePlan = false;
  bool isSelectTenDollarPlan = false;
  bool isSelectSixteenDollarPlan = false;
  bool isSelectHundredNinetyDollarPlan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Stack(children: [
            Container(
              color: Colors.white,
            ),
            backgroundPainter(),
            planContainer(),
          ]),
        ));
  }

  Widget backgroundPainter() {
    return CustomPaint(
      painter: Painter(),
      child: Container(),
    );
  }

  Widget planContainer() {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.0, right: 25.0, top: 60.0, bottom: 60.0),
      child: Container(
        height: sizeHeight,
        width: sizeWidth,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20.0)),
        padding:
            EdgeInsets.only(left: 15.0, top: 25.0, right: 15.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceSmall,
            Align(
              alignment: Alignment.topLeft,
              child: AppBackButton(
                horizontalIcon: false,
              ),
            ),
            verticalSpaceRegular,
            titleTxt(),
            verticalSpaceSmall,
            subTitleTxt(),
            verticalSpaceMedium,
            plansView(),
            verticalSpaceMedium,
            applePay(),
            verticalSpaceMedium,
            termsText(),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.center,
              child: AppPrimaryButton(
                  buttonHeight: 40,
                  buttonWidth: sizeWidth * 0.7,
                  buttonText: cont_button,
                  callback: () => Get.to(() => NewWorkSpace())),
            ),
          ],
        ),
      ),
    );
  }

  Widget plansView() {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isSelectFreePlan == false
                  ? SelectPlanView(
                      subscription_days: basic_plan_days,
                      plan: basic_plan_amt,
                      onPressed: () {
                        setState(() {
                          isSelectFreePlan = true;
                        });
                        Future.delayed(Duration(milliseconds: 200), () async {
                          planDetails(
                              basic_plan,
                              basic_plan_days,
                              basic_plan_amt,
                              sel_check_img,
                              unsel_check_img,
                              details_one,
                              details_Two,
                              details_Three,
                              details_Three,
                              details_Three);
                        });
                      },
                    )
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SelectPlanView(
                          subscription_days: basic_plan_days,
                          plan: basic_plan_amt,
                          onPressed: () {
                            setState(() {
                              isSelectFreePlan = false;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
                            child: Image.asset(
                              check_custom_painter_img,
                              width: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
              isSelectTenDollarPlan == false
                  ? SelectPlanView(
                      subscription_days: standard_plan_days,
                      plan: standard_plan_amt,
                      onPressed: () {
                        setState(() {
                          isSelectTenDollarPlan = true;
                        });
                        Future.delayed(Duration(milliseconds: 200), () async {
                          planDetails(
                              standard_plan,
                              standard_plan_days,
                              standard_plan_amt,
                              sel_check_img,
                              unsel_check_img,
                              details_one,
                              details_Two,
                              details_Three,
                              details_Three,
                              details_Three);
                        });
                      },
                    )
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SelectPlanView(
                          subscription_days: standard_plan_days,
                          plan: standard_plan_amt,
                          onPressed: () {
                            setState(() {
                              isSelectTenDollarPlan = false;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
                            child: Image.asset(
                              check_custom_painter_img,
                              width: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
          SizedBox(
            height: sizeHeight * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isSelectSixteenDollarPlan == false
                  ? SelectPlanView(
                      subscription_days: diamond_plan_days,
                      plan: diamond_plan_amt,
                      onPressed: () {
                        setState(() {
                          isSelectSixteenDollarPlan = true;
                        });
                        Future.delayed(Duration(milliseconds: 200), () async {
                          planDetails(
                              diamond_plan,
                              diamond_plan_days,
                              diamond_plan_amt,
                              sel_check_img,
                              unsel_check_img,
                              details_one,
                              details_Two,
                              details_Three,
                              details_Three,
                              details_Three);
                        });
                      },
                    )
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SelectPlanView(
                          subscription_days: diamond_plan_days,
                          plan: diamond_plan_amt,
                          onPressed: () {
                            setState(() {
                              isSelectSixteenDollarPlan = false;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
                            child: Image.asset(
                              check_custom_painter_img,
                              width: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
              isSelectHundredNinetyDollarPlan == false
                  ? SelectPlanView(
                      subscription_days: platinum_plan_days,
                      plan: platinum_plan_amt,
                      onPressed: () {
                        setState(() {
                          isSelectHundredNinetyDollarPlan = true;
                        });
                        Future.delayed(Duration(milliseconds: 200), () async {
                          planDetails(
                              platinum_plan,
                              platinum_plan_days,
                              platinum_plan_amt,
                              sel_check_img,
                              unsel_check_img,
                              details_one,
                              details_Two,
                              details_Three,
                              details_Three,
                              details_Three);
                        });
                      },
                    )
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SelectPlanView(
                          subscription_days: platinum_plan_days,
                          plan: platinum_plan_amt,
                          onPressed: () {
                            setState(() {
                              isSelectHundredNinetyDollarPlan = false;
                            });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
                            child: Image.asset(
                              check_custom_painter_img,
                              width: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget titleTxt() {
    return Column(
      children: [
        Text(plan_text,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0),
                ],
                color: Colors.black)),
        SizedBox(
          height: 5,
        ),
        Text(plan_text_two,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0),
                ],
                color: Colors.black)),
      ],
    );
  }

  Widget subTitleTxt() {
    return Text(sub_plan_txt,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black.withOpacity(0.8)));
  }

  Widget termsText() {
    return Text(terms_txt,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: Colors.black.withOpacity(0.8)));
  }

  Widget applePay() {
    return Container(
      height: 40,
      width: sizeWidth * 0.6,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26, width: 1)),
      child: CustomListView(
        title: apple_pay_txt,
        image: apple_pay_img,
      ),
    );
  }

  // Show Dialog For Plan Details
  Future planDetails(
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
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 30.0, 30.0, 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(plan_img,
                                        height: 60, width: 60),
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
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                            child: Text(days),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    try {
                                      Navigator.pop(context);
                                    } catch (exception) {
                                      print(exception);
                                    }
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 1)),
                                    child: Icon(
                                      Icons.close_sharp,
                                      size: 18.0,
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
                              callback: () => Get.to(() => NewWorkSpace())),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
