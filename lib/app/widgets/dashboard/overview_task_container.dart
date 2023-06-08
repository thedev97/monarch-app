import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../listviews/select-activity.dart';

class OverviewTaskContainer extends StatelessWidget {
  OverviewTaskContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectActivityView(
              activity: projectActivity,
              totalCount: projectCount,
              progressValue: 0.7,
            ),
            SelectActivityView(
                activity: taskActivity,
                totalCount: taskCount,
                progressValue: 0.8),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectActivityView(
                activity: pendingActivity,
                totalCount: pendingCount,
                progressValue: 0.55),
            SelectActivityView(
                activity: completedActivity,
                totalCount: completedCount,
                progressValue: 0.9),
          ],
        ),
      ],
    );
  }
}
