import 'package:flutter/material.dart';
import '../../../core/values/values.dart';
import '../../../widgets/dashboard/daily_goal_card.dart';

class DashboardProductivity extends StatelessWidget {
  const DashboardProductivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DailyGoalCard(),
        AppSpaces.verticalSpace20,
        //ProductivityChart()
      ],
    );
  }
}
