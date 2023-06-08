import 'package:Monarch/app/core/values/sizes.dart';
import 'package:Monarch/app/core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../core/values/strings.dart';
import 'horizontal-calendar.dart';

typedef OnDateSelected(date);

class HorizontalCalendar extends StatefulWidget {
  HorizontalCalendar({
    key,
    required this.date,
    DateTime? initialDate,
    DateTime? lastDate,
    this.textColor,
    this.backgroundColor,
    this.selectedColor,
    this.showMonth = false,
    this.locale = const Locale('en', ''),
    required this.onDateSelected,
  })  : initialDate = DateUtils.dateOnly(initialDate ?? DateTime.now()),
        lastDate = DateUtils.dateOnly(
            lastDate ?? DateTime.now().add(Duration(days: 90))) {
    assert(
      !this.lastDate.isBefore(this.initialDate),
      'lastDate ${this.lastDate} must be on or after initialDate ${this.initialDate}.',
    );
    assert(
      !this.initialDate.isBefore(this.initialDate),
      'initialDate ${this.initialDate} must be on or after initialDate ${this.initialDate}.',
    );
    assert(
      !this.initialDate.isAfter(this.lastDate),
      'initialDate ${this.initialDate} must be on or before lastDate ${this.lastDate}.',
    );
  }

  /// The initially selected [DateTime] that the picker should display.
  final DateTime date;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime initialDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// The [Color] to represent unselected [DateTime] color
  final Color? textColor;

  /// The [Color] to represent calendar background color
  final Color? backgroundColor;

  /// The [Color] to represent selected [DateTime] color
  final Color? selectedColor;

  /// Condition [boolean] to show the month's name
  final bool showMonth;

  /// Change the locale of the calendar
  final Locale locale;

  /// Called when the user selects a date in the picker.
  final OnDateSelected onDateSelected;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<HorizontalCalendar> {
  late DateTime _startDate;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = widget.date;
    initializeDateFormatting();
    DateTime now = DateTime.now();
    var dateString = DateFormat('dd-MM-yyyy').format(now);
    final String configFileName = 'lastConfig.$dateString.json';
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 100;
    _startDate = selectedDate.subtract(Duration(days: 3));

    return SizedBox(
      height: height * (widget.showMonth ? 11 : 10),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.all(0.0),
        title: widget.showMonth
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    workWeek,
                    style: AppTextStyles.subHeader5,
                  ),
                  AppSpaces.horizontalSpace5,
                  GestureDetector(
                    onTap: () async {
                      DateTime? date = await selectDate();
                      if (date != null) {
                        widget.onDateSelected(date);
                        setState(() => selectedDate = date);
                      }
                    },
                    child: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            : Offstage(),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: sizeWidth*0.125,
                        child: CalendarItems(
                          index: index,
                          startDate: _startDate,
                          initialDate: widget.initialDate,
                          selectedDate: selectedDate,
                          textColor: widget.textColor ?? Colors.black45,
                          selectedColor:
                              widget.selectedColor ?? Theme.of(context).primaryColor,
                          backgroundColor: widget.backgroundColor ?? Colors.white,
                          locale: widget.locale,
                          onDatePressed: () =>
                              onDatePressed(index, widget.initialDate),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: selectedDate,
      firstDate: widget.initialDate,
      lastDate: widget.lastDate,
      locale: Localizations.localeOf(context),
    );
  }

  void onDatePressed(int index, DateTime? initialDate) {
    DateTime date = _startDate.add(Duration(days: index));
    // int diffDays = date.difference(selectedDate).inDays;
    int checkDate = date.difference(widget.initialDate).inDays;
    if (checkDate >= 0) {
      widget.onDateSelected(date);
      setState(() {
        selectedDate = _startDate.add(Duration(days: index));
        _startDate = _startDate.add(Duration(days: index));
      });
    }
  }
}
