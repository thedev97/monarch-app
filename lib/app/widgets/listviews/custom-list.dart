import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/sizes.dart';

class CustomListView extends StatelessWidget {
  final String image;
  final String title;

  const CustomListView({Key? key, required this.image, required this.title})
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
              Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  image,
                ),
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
                      color: Colors.black.withOpacity(0.8)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
