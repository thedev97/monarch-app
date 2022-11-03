import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/widgets/dummy/profile_dummy_img.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';
import '../dummy/green_done_icon.dart';

class ActiveEmployeeCard extends StatelessWidget {
  final String employeeName;
  final String employeeImage;
  final Color color;
  final String employeePosition;
  final ValueNotifier<bool> notifier;

  const ActiveEmployeeCard(
      {Key? key,
      required this.employeeName,
      required this.employeeImage,
      required this.employeePosition,
      required this.notifier,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        notifier.value = !notifier.value;
      },
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ...progressCardGradientList,
              ],
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: HexColor.fromHex("87C76F").withOpacity(0.5)),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      ProfileDummyImg(
                        dummyType: ProfileDummyTypeImg.Image,
                        scale: 0.9,
                        color: color,
                        image: employeeImage,
                      ),
                      AppSpaces.horizontalSpace20,
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(employeeName.toUpperCase(),
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.2)),
                            SizedBox(height: 4),
                            Text(employeePosition.toUpperCase(),
                                style: GoogleFonts.lato(
                                    color: Colors.white,))
                          ])
                    ]),
                    Align(
                        alignment: Alignment.topCenter, child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: GreenDoneIcon(),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
