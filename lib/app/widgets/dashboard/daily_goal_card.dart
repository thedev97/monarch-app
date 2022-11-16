import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../circleTabIndicator/circleProgress.dart';
import '../../core/constants.dart';

class DailyGoalCard extends StatefulWidget {
  const DailyGoalCard({Key? key}) : super(key: key);

  @override
  State<DailyGoalCard> createState() => _DailyGoalCardState();
}

class _DailyGoalCardState extends State<DailyGoalCard>
    with TickerProviderStateMixin {
  AnimationController? progressController;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = Tween<double>(begin: 0, end: 80).animate(
        CurvedAnimation(parent: progressController!, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    progressController!.forward();
  }

  @override
  void dispose() {
    progressController!.dispose();
    super.dispose();
  }

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
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HobNob - Mobile Application',
                      style: GoogleFonts.lato(
                          color: Colors.grey.shade800,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 1.0),
                          ],
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                  AppSpaces.verticalSpace10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                              color: HexColor.fromHex("8ACA72"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Center(
                            child: Text('3/5',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 16,
                                )),
                          )),
                      AppSpaces.horizontalSpace10,
                      Text('Tasks',
                          style: GoogleFonts.lato(
                              color: HexColor.fromHex("676979"),
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  AppSpaces.verticalSpace10,
                  Text('You marked 3/5 tasks\nare done 🎉',
                      style: GoogleFonts.lato(
                          color: HexColor.fromHex("616575"),
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                  AppSpaces.verticalSpace20,
                  Container(
                    width: 120,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                HexColor.fromHex("C25FFF")),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(
                                        color: HexColor.fromHex("C25FFF"))))),
                        child: Text('All Task',
                            style: GoogleFonts.lato(
                                fontSize: 17,
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(0.0, 0.5),
                                      blurRadius: 0.5),
                                ],
                                fontWeight: FontWeight.w700,
                                color: Colors.white))),
                  )
                ],
              ),
              Stack(
                children: [circularProgress()],
              )
            ]));
  }

  Widget circularProgress() {
    return CustomPaint(
      foregroundPainter: CircleProgress(animation!.value / 1.2),
      // this will add custom painter after child
      child: Container(
        width: 90,
        height: 90,
        child: Center(
          child: Image.asset(
            "assets/small-logo.png",
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
