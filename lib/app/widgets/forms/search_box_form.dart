import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/values.dart';

class SearchBoxInput extends StatelessWidget {
  final String placeholder;

  final TextEditingController? controller;

  const SearchBoxInput({
    Key? key,
    required this.placeholder,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      onTap: () {},
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor.fromHex("1E2027")),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor.fromHex("1E2027")),
          borderRadius: BorderRadius.circular(12.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor.fromHex("1E2027")),
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Icon(FeatherIcons.search, color: HexColor.fromHex("FDA7FF")),
        ),
        suffixIcon: InkWell(
          onTap: () {
            controller!.text = "";
          },
          child: Icon(FontAwesomeIcons.solidTimesCircle,
              color: Colors.black, size: 20),
        ),
        hintText: placeholder,
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Colors.grey.withOpacity(0.6)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
