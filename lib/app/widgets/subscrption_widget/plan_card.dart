import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../listviews/select-views.dart';

class PlanCard extends StatelessWidget {
  final String subscriptionDays;
  final String plan;
  final bool isSelected;

  const PlanCard(
      {Key? key,
      required this.subscriptionDays,
      required this.isSelected,
      required this.plan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SelectPlanView(
          subscription_days: subscriptionDays,
          plan: plan,
        ),
        isSelected == true
            ? Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(16)),
                  child: Image.asset(
                    check_custom_painter_img,
                    width: 50,
                  ),
                ),
              )
            : Container(),
        isSelected == true
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.check,
                  size: 15,
                  color: Colors.white,
                ),
              )
            : Container(),
      ],
    );
  }
}
