import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';

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
          //color: Color(0xffE79381)
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ...progressCardGradientList,
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
                        fontWeight: FontWeight.w600, fontSize: 16,
                        color: Colors.black, shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 0.2),
                      ],)),
                  AppSpaces.verticalSpace10,
                  Text('$rating is completed',
                      style: GoogleFonts.lato(
                        color: HexColor.fromHex("5E6272"),
                          fontWeight: FontWeight.w700, fontSize: 14)),
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
                              color: Colors.white),
                          child: Row(children: [
                            Expanded(
                                flex: percentageGap,
                                child: Container(
                                    decoration: BoxDecoration(
                                  color: HexColor.fromHex("#262A34"),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                ))),
                            Expanded(flex: 1, child: SizedBox())
                          ])),
                      Spacer(),
                      Text("$progressFigure%",
                          style: GoogleFonts.lato(fontWeight: FontWeight.bold, color: Colors.black))
                    ],
                  )
                ],
              ))
        ]));
  }
}
