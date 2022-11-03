import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/widgets/dummy/profile_dummy_img.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';

class InactiveEmployeeCard extends StatelessWidget {
  final String employeeName;
  final String employeeImage;
  final ValueNotifier<bool> notifier;
  final String employeePosition;
  final Color color;

  const InactiveEmployeeCard(
      {Key? key,
      required this.employeeName,
      required this.color,
      required this.employeeImage,
      required this.employeePosition,
      required this.notifier})
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
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryBackgroundColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 2), // Shadow position
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ...progressCardGradient,
              ],
            ),
            borderRadius: BorderRadius.circular(16)),
        child: Row(children: [
          ProfileDummyImg(
            dummyType: ProfileDummyTypeImg.Image,
            scale: 0.9,
            color: color,
            image: employeeImage,
          ),
          AppSpaces.horizontalSpace20,
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(employeeName.toUpperCase(),
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(0.0, 0.5),
                              blurRadius: 0.5),
                        ],
                        fontWeight: FontWeight.w600,
                        fontSize: 13)),
                Text(employeePosition.toUpperCase(),
                    style: GoogleFonts.lato(
                        color: HexColor.fromHex("5A5E6D"),
                        fontWeight: FontWeight.w500,
                        fontSize: 12))
              ])
        ]),
      ),
    );
  }
}
