import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';

class ActiveProjectSelectableContainer extends StatelessWidget {
  final String header;
  final ValueNotifier<bool> notifier;

  const ActiveProjectSelectableContainer({
    Key? key,
    required this.header,
    required this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.value = !notifier.value;
      },
      child: Container(
          width: double.infinity,
          height: 70,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBackgroundColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 4), // Shadow position
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ...progressCardGradient,
              ],
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor.fromHex("FDA7FF"),
                  ),
                  child: Center(
                      child: Icon(Icons.done, size: 20, color: Colors.white))),
              AppSpaces.horizontalSpace20,
              Text("$header",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w400, fontSize: 16,
                    color: Colors.black, shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.5),
                        blurRadius: 0.2),
                  ],)),
            ]),
            SizedBox()
          ])),
    );
  }
}
