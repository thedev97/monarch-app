import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';
import 'bar_chart.dart';

class ProductivityChart extends StatelessWidget {
  const ProductivityChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        height: 220,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ...progressCardGradient,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          border: Border.all(color: AppColors.primaryBackgroundColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: BarChartSample());
  }
}
