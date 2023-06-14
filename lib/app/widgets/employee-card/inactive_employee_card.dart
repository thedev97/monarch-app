import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';
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
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.8), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 2), // Shadow position
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          ProfileDummyImg(
            dummyType: ProfileDummyTypeImg.Image,
            scale: 1,
            color: color,
            image: employeeImage,
          ),
          AppSpaces.horizontalSpace20,
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(employeeName,
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.2),
                              blurRadius: 0.2),
                        ],
                        fontWeight: FontWeight.w500,
                        fontSize: 12)),
                AppSpaces.verticalSpace10,
                Text(employeePosition,
                    style: GoogleFonts.lato(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 10))
              ])
        ]),
      ),
    );
  }
}
