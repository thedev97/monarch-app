import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class TextFormInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final String keyboardType;
  final bool obscureText;
  final String? Function(String?)? validatorFunction;
  final TextEditingController controller;

  const TextFormInput(
      {Key? key,
      required this.placeholder,
      required this.keyboardType,
      required this.controller,
      required this.obscureText,
      required this.label,
      required this.validatorFunction,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpaces.verticalSpace10,
        Text(label.toUpperCase(),
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0),
                ],
                fontSize: 8, color: Colors.black)),
        TextFormField(
          controller: controller,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: Colors.black,
            shadows: [
              Shadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0),
            ],
          ),
          onTap: () {},
          validator: validatorFunction,
          keyboardType: keyboardType == "text"
              ? TextInputType.text
              : TextInputType.number,
          obscureText:
              placeholder == 'Password' || placeholder == 'Choose a password'
                  ? true
                  : false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              suffixIcon:
                  placeholder == "Password" || placeholder == "Confirm Password"
                      ? InkWell(
                          onTap: () {},
                          child: Icon(
                            obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 18,
                            color: HexColor.fromHex("3C3E49"),
                          ))
                      : InkWell(
                          onTap: () {
                            controller.text = "";
                          },
                          child: Icon(FontAwesomeIcons.solidTimesCircle,
                              size: 18, color: Colors.black),
                        ),
              hintText: placeholder,
              hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey),
              filled: false,
              errorStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w400, fontSize: 10, color: Colors.red),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
        ),
      ],
    );
  }
}
