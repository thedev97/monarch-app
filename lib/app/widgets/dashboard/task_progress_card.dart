import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';
import '../buttons/progress_card_close_button.dart';

class TaskProgressCard extends StatelessWidget {
  final String cardTitle;
  final String rating;
  final String progressFigure;
  final int percentageGap;
  TaskProgressCard(
      {Key? key,
      required this.rating,
      required this.cardTitle,
      required this.progressFigure,
      required this.percentageGap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
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
        child: Stack(children: [
          Positioned(
              top: 22,
              bottom: 15,
              right: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cardTitle,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500, fontSize: 16,
                        color: Colors.black, shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0),
                      ],)),
                  AppSpaces.verticalSpace10,
                  Text('$rating is completed',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500, fontSize: 14)),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                          width: 150,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.grey.withOpacity(0.5)),
                          child: Row(children: [
                            Expanded(
                                flex: percentageGap,
                                child: Container(
                                    decoration: BoxDecoration(
                                  color: HexColor.fromHex("#78bac0"),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                ))),
                            Expanded(flex: 1, child: SizedBox())
                          ])),
                      Spacer(),
                      Text("$progressFigure%",
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ))
        ]));
  }
}
