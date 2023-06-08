import 'dart:math';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/core/values/sizes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/strings.dart';
import '../../core/values/values.dart';

class BarChartSample extends StatelessWidget {
  const BarChartSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: _WeeklyCalendar(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: _ChartHeader(),
        ),
        Expanded(child: _Chart()),
      ],
    );
  }
}

class _WeeklyCalendar extends StatelessWidget {
  const _WeeklyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    findFirstDateOfTheWeek(today);
    findLastDateOfTheWeek(today);
    return Container(
      height: 30,
      width: sizeWidth * 0.5,
      decoration: BoxDecoration(
          color: calendarColor.withOpacity(0.7),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: whiteColor, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.calendar_month,
            size: 15,
            color: Colors.black,
          ),
          Text(
            startWeekDate.toString(),
            style: AppTextStyles.subHeader,
          ),
          Text(
            "-",
            style: AppTextStyles.subHeader,
          ),
          Text(
            endWeekDate.toString(),
            style: AppTextStyles.subHeader,
          ),
          GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 14,
                color: Colors.grey,
              )),
          GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.black,
              )),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class _ChartHeader extends StatelessWidget {
  const _ChartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productivityChartTxt,
                style: AppTextStyles.header2,
              ),
              SizedBox(height: 8),
              Text(
                productivityAnalysis,
                style: AppTextStyles.subHeader,
              ),
            ],
          ),
        ),
        Material(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: PopupMenuButton(
            itemBuilder: (context) {
              return popupOptions
                  .map((option) => PopupMenuItem(
                          child: Text(
                        option,
                        style: AppTextStyles.subHeader2,
                      )))
                  .toList();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: Row(
                children: [
                  Text(
                    popupOptions[0],
                    style: AppTextStyles.subHeader2,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Chart extends StatefulWidget {
  const _Chart({Key? key}) : super(key: key);

  @override
  State<_Chart> createState() => _ChartState();
}

class _ChartState extends State<_Chart> {
  int tapIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        // remove background grid
        gridData: FlGridData(show: false),
        // remove the borders
        borderData: FlBorderData(
          border: const Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
          ),
        ),
        // titles
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final day = activity[value.toInt()].day;
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(day,
                      style: GoogleFonts.lato(
                          fontWeight: tapIndex == value.toInt()
                              ? FontWeight.w800
                              : FontWeight.w400,
                          fontSize: 12,
                          color: tapIndex == value.toInt()
                              ? Colors.black
                              : Colors.black.withOpacity(0.8))),
                );
              },
            ),
          ),
        ),
        maxY: maxValue.toDouble(),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              direction: TooltipDirection.top,
              rotateAngle: 0,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.toY.toInt().toString(),
                  AppTextStyles.subHeader3,
                );
              }),
          enabled: true,
          touchCallback: (event, response) {
            if (response != null && event is FlTapUpEvent) {
              setState(() {
                if (response.spot != null) {
                  tapIndex = response.spot!.touchedBarGroupIndex;
                }
              });
            }
          },
        ),
        barGroups: [
          for (int i = 0; i < activity.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                    toY: activity[i].dailyActivity.toDouble(),
                    color: tapIndex == i ? Colors.blue : primaryColor,
                    width: 15,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ],
            )
        ],
      ),
    );
  }
}

final popupOptions = <String>[
  'Weekly',
  'Monthly',
  'Yearly',
];

var startWeekDate;
var endWeekDate;

/// Find the first date of the week which contains the provided date.
findFirstDateOfTheWeek(DateTime dateTime) {
  var startDate = dateTime.subtract(Duration(days: dateTime.weekday - 1));
  startWeekDate = DateFormat.MMMd().format(startDate);
  return startWeekDate;
}

/// Find last date of the week which contains provided date.
findLastDateOfTheWeek(DateTime dateTime) {
  var endDate =
      dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  endWeekDate = DateFormat.MMMd().format(endDate);
  return endWeekDate;
}

class DailyActivity {
  DailyActivity(this.day, this.dailyActivity);

  final String day;
  final int dailyActivity;
}

final activity = <DailyActivity>[
  DailyActivity('Mo', 850),
  DailyActivity('Tu', 550),
  DailyActivity('We', 750),
  DailyActivity('Th', 700),
  DailyActivity('Fr', 850),
  DailyActivity('Sa', 350),
  DailyActivity('Su', 250),
];

final maxValue = activity.map((e) => e.dailyActivity).reduce(max);
