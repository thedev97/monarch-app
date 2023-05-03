import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';

class PlanInfoViews extends StatelessWidget {
  final String image;
  final String title;

  const PlanInfoViews({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizeWidth,
      height: 25,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                image,
                height: 50,
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.2),
                            blurRadius: 0.2),
                      ],
                      fontSize: 12,
                      color: image != unsel_check_img
                          ? Colors.black.withOpacity(0.8)
                          : Colors.grey.withOpacity(0.8)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
