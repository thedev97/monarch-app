import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class ActiveTaskCard extends StatelessWidget {
  final String header;
  final String subHeader;
  final ValueNotifier<bool> notifier;
  final String date;

  const ActiveTaskCard(
      {Key? key,
      required this.header,
      required this.notifier,
      required this.subHeader,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: InkWell(
        onTap: () {
          notifier.value = !notifier.value;
        },
        child: Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 0.5,
                      spreadRadius: 0.5),
                  BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      offset: Offset(-1.0, -1.0),
                      blurRadius: 0.4,
                      spreadRadius: 0.4),
                ],
                color: AppColors.primaryBackgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: ClipOval(
                        child: Center(
                          child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.pink,
                                        AppColors.lightMauveBackgroundColor
                                      ]),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: Container(
                                              width: 5,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle)))))),
                        ),
                      ),
                    ),
                    AppSpaces.horizontalSpace20,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(header,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.0, 0.5),
                                        blurRadius: 0.5),
                                  ],
                                  fontSize: 14)),
                          Text(subHeader,
                              style: GoogleFonts.lato(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12))
                        ])
                  ]),
                  Text(date,
                      style: GoogleFonts.lato(
                          color: HexColor.fromHex("F5A3FF"),
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(0.0, 0.5),
                                blurRadius: 0.2),
                          ],
                          fontWeight: FontWeight.w500,
                          fontSize: 12))
                ])),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          //caption: 'More',
          color: HexColor.fromHex("B1FEE2"),
          icon: Icons.share,

          // onTap: () => _showSnackBar('More'),
        ),
        IconSlideAction(
          //caption: 'Delete',
          iconWidget: Icon(Icons.delete, size: 35),
          color: HexColor.fromHex("F5A3FF"),

          // onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }
}
