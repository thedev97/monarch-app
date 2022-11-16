import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class TaskFormInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String keyboardType;
  final bool? autofocus;
  final bool obscureText;
  final TextEditingController? controller;

  const TaskFormInput({
    Key? key,
    this.autofocus,
    required this.placeholder,
    required this.keyboardType,
    this.controller,
    required this.label,
    required this.obscureText,
  }) : super(key: key);

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
                fontSize: 12, color: HexColor.fromHex("3C3E49"))),
        TextFormField(
          controller: controller,
          autofocus: autofocus ?? false,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          onTap: () {},
          keyboardType: keyboardType == "text"
              ? TextInputType.text
              : keyboardType == "multiline"
                  ? TextInputType.multiline
                  : TextInputType.number,
          minLines: 1,
          maxLines:  keyboardType == "multiline" ? 3 : 1,
          obscureText:
              placeholder == 'Password' || placeholder == 'Choose a password'
                  ? true
                  : false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 18,
              ),
              suffixIcon: placeholder == "Password"
                  ? InkWell(
                      onTap: () {},
                      child: Icon(
                        obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        size: 15.0,
                        color: HexColor.fromHex("3C3E49"),
                      ))
                  : InkWell(
                      onTap: () {
                        controller!.text = "";
                      },
                      child: Icon(FontAwesomeIcons.solidTimesCircle,
                          color: HexColor.fromHex("3C3E49"), size: 20),
                    ),
              hintText: placeholder,
              hintStyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: Colors.grey.withOpacity(0.6)),
              filled: false,
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
