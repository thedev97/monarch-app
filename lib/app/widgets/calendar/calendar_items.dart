import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarItems extends StatelessWidget {
  CalendarItems({
    Key? key,
    required this.index,
    required this.startDate,
    required this.initialDate,
    required this.selectedDate,
    required this.textColor,
    required this.selectedColor,
    required this.backgroundColor,
    required this.locale,
    required this.onDatePressed,
  }) : super(key: key);

  final int index;
  final DateTime startDate;
  final DateTime initialDate;
  final DateTime selectedDate;
  final Color textColor;
  final Color selectedColor;
  final Color backgroundColor;
  final Locale locale;
  final VoidCallback onDatePressed;

  @override
  Widget build(BuildContext context) {
    DateTime date = startDate.add(Duration(days: index));
    int diffDays = date.difference(selectedDate).inDays;
    int checkPastDate = date.difference(initialDate).inDays;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: (width / 100) * 12.5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: diffDays != 0 ? backgroundColor : selectedColor,
        border: Border.all(color: diffDays != 0
            ? checkPastDate >= 0
            ? textColor
            : Colors.grey.shade500
            : Colors.black,width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onDatePressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat.E(locale.toString()).format(date),
              style: GoogleFonts.lato(
                  color: diffDays != 0
                      ? checkPastDate >= 0
                      ? textColor
                      : Colors.grey.shade500
                      : Colors.white,
                  shadows: [
                    Shadow(color: Colors.white, offset: Offset(0.0, 0.5), blurRadius: 0.5),
                  ],
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
            SizedBox(height: 8.0),
            Text(
              DateFormat.d(locale.toString()).format(date),
              style: GoogleFonts.lato(
                  color: diffDays != 0
                      ? checkPastDate >= 0
                      ? textColor
                      : Colors.grey.shade500
                      : Colors.white,
                  shadows: [
                    Shadow(color: Colors.black, offset: Offset(0.0, 0.5), blurRadius: 0.5),
                  ],
                  fontWeight: FontWeight.w500,
              fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}