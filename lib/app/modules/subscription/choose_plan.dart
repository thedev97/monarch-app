import 'package:get/get.dart';
import '../../core/commons.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../core/utils/custom-painter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/data_model.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/navigation/back_button.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/widgets/listviews/custom-list.dart';
import 'package:Monarch/app/widgets/subscrption_widget/plan_card.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:Monarch/app/controllers/subscription/select-plan.dart';

class ChoosePlan extends StatefulWidget {
  String? email;
  int? userId;
  String? token;

  ChoosePlan({Key? key, this.email, this.userId, this.token}) : super(key: key);

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  SelectPlanController planController = Get.put(SelectPlanController());

  String plan = "";

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
      padding: EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: sizeHeight * 0.1,
          bottom: sizeHeight * 0.075),
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
            Obx(
              () => planController.loading.value
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: const SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: AppPrimaryButton(
                          buttonHeight: 40,
                          buttonWidth: sizeWidth * 0.7,
                          buttonText: cont_button,
                          callback: () => planController.subscriptionApi(
                              widget.email ?? "",
                              plan,
                              widget.userId ?? 0,
                              widget.token ?? "")),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget plansView() {
    final dynamic planListData = AppData.planList;
    var activePlan = DynamicHeightGridView(
      itemCount: planListData.length,
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSpacing: 15,
      builder: (ctx, index) => GestureDetector(
        onTap: () {
          setState(() {
            for (int i = 0; i < planListData.length; i++) {
              if (i == index) {
                setState(() {
                  planListData[i]['isSelected'] = true;
                  planDetails(i);
                  plan = planListData[i]['subscriptionDays'];
                });
              } else {
                setState(() {
                  planListData[i]['isSelected'] = false;
                });
              }
            }
          });
        },
        child: PlanCard(
          subscriptionDays: planListData[index]['subscriptionDays'],
          plan: planListData[index]['plan'],
          isSelected: planListData[index]['isSelected'],
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: activePlan,
    );
  }

  Widget titleTxt() {
    return Column(
      children: [
        Text(plan_text,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 20,
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
                fontSize: 20,
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

  planDetails(int index) {
    if (index == 0) {
      Future.delayed(Duration(milliseconds: 200), () async {
        Commons.planDetails(
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
    } else if (index == 1) {
      Future.delayed(Duration(milliseconds: 200), () async {
        Commons.planDetails(
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
    } else if (index == 2) {
      Future.delayed(Duration(milliseconds: 200), () async {
        Commons.planDetails(
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
    } else {
      Future.delayed(Duration(milliseconds: 200), () async {
        Commons.planDetails(
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
    }
  }
}
