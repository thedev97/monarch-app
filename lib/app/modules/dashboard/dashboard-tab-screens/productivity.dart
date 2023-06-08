import 'package:flutter/material.dart';
import '../../../widgets/dashboard/productivity_chart.dart';

class DashboardProductivity extends StatelessWidget {
  const DashboardProductivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductivityChart(),
      ],
    );
  }
}
