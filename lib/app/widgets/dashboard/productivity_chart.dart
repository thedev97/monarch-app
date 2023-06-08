import 'bar_chart.dart';
import 'package:flutter/material.dart';

class ProductivityChart extends StatelessWidget {
  const ProductivityChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 5),
        height: 250,
        child: BarChartSample());
  }
}
