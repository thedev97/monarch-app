import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class PasswordInputField extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final bool autoFocus;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final TextCapitalization textCapitalization;
  final Color? color;
  final int? maxLength;
  final Function()? onTapFunction;
  final Widget? suffixIcon;
  final bool enabled;
  final TextStyle? inputTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;

  PasswordInputField({
    Key? key,
    this.onChanged,
    this.keyBoardType,
    required this.obscureText,
    this.controller,
    required this.autoFocus,
    this.color,
    this.hintText,
    this.validatorFunction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onTapFunction,
    this.suffixIcon,
    this.enabled = true,
    this.inputFormatters,
    this.suffix,
    this.inputTextStyle,
  }) : super(key: key);

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      onTap: widget.onTapFunction,
      textAlign: TextAlign.start,
      maxLength: widget.maxLength,
      maxLines: 1,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black),
      textCapitalization: widget.textCapitalization,
      controller: widget.controller,
      keyboardType: widget.keyBoardType,
      autofocus: widget.autoFocus,
      enabled: widget.enabled,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validatorFunction,
      decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          counter: widget.maxLength == 1 ? Container() : null,
          counterText: "",
          errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.lato(
              fontWeight: FontWeight.w800,
              fontSize: 13,
              color: Colors.black.withOpacity(0.5)),
          filled: false,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 18,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green))),
    );
  }
}
