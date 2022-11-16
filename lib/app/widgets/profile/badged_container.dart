import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';

class BadgedContainer extends StatelessWidget {
  final String label;
  final String value;
  final String badgeColor;
  final VoidCallback? callback;
  final IconData iconData;

  const BadgedContainer(
      {Key? key,
      required this.label,
      required this.value,
      required this.badgeColor,
      required this.iconData,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: double.infinity,
        height: 90,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ...progressCardGradient,
            ],
          ),
          border: Border.all(color: AppColors.primaryBackgroundColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.purpleAccent, shape: BoxShape.circle),
              child: Icon(iconData,
                  color: Colors.white, size: 25)),
          AppSpaces.horizontalSpace20,
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0),
                      ],
                    )),
                SizedBox(height: 5),
                (value == "Off")
                    ? Text(value,
                    overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: HexColor.fromHex("5E6272")))
                    : Text(value,
                    overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: HexColor.fromHex("5E6272")))
              ])
        ]),
      ),
    );
  }
}
