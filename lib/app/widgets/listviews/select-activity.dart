import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/core/values/sizes.dart';

class SelectActivityView extends StatelessWidget {
  final String totalCount;
  final String activity;
  final double progressValue;

  const SelectActivityView(
      {Key? key,
      required this.totalCount,
      required this.activity,
      required this.progressValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth * 0.4,
      height: sizeHeight * 0.14,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: whiteColor, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          circularProgress(),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(totalCount,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 0.5),
                      ],
                      color: Colors.black)),
              SizedBox(
                width: 5,
              ),
              Text(activity,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 0.5),
                      ],
                      color: Colors.black)),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget circularProgress() {
    return Container(
      height: 15,
      width: 15,
      child: CircularProgressIndicator(
        value: progressValue,
        strokeWidth: 30,
        color: primaryColor,
        backgroundColor: Colors.white,
      ),
    );
  }
}
