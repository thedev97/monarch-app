import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectPlanView extends StatelessWidget {
  final String subscription_days;
  final String plan;
  final Function()? onPressed;

  const SelectPlanView(
      {Key? key, required this.subscription_days, required this.plan, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black26, width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(plan,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 0.5),
                          blurRadius: 0.5),
                    ],
                    color: Colors.black)),
            SizedBox(height: 5,),
            Text(subscription_days,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Colors.black.withOpacity(0.8))),
          ],
        ),
      ),
    );
  }
}
