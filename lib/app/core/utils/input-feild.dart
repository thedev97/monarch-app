//? An input field class for all the input boxes in the app.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  final String? labelText;
  final bool obscureText;
  final bool autoFocus;
  final bool labelPresent;
  final String? hintText;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final TextCapitalization textCapitalization;
  final Color? color;
  final int? maxLength;
  final Function()? onEditingComplete;
  final Function()? onTapFunction;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool? onTaped;
  final OutlineInputBorder? enabledBorder;
  final BorderSide? borderSide;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? enabled;
  final TextStyle? inputTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final double depth;

  InputField({
    Key? key,
    this.onChanged,
    this.keyBoardType,
    this.labelText,
    required this.obscureText,
    this.controller,
    required this.autoFocus,
    required this.edgeInsetsGeometry,
    this.color,
    required this.labelPresent,
    this.hintText,
    this.onTaped,
    this.validatorFunction,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.onEditingComplete,
    this.onTapFunction,
    this.suffixIcon,
    this.readOnly = false,
    this.enabledBorder,
    this.borderSide,
    this.hintStyle,
    this.enabled = true,
    this.inputFormatters,
    this.labelStyle,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.inputTextStyle,
    this.depth = -5,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.edgeInsetsGeometry,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.labelPresent
              ? Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5),
                  child: Text(
                    widget.labelText!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                )
              : Container(),
          TextFormField(
            cursorColor: Colors.grey,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readOnly,
            onEditingComplete: widget.onEditingComplete,
            onTap: widget.onTapFunction,
            textAlign: TextAlign.start,
            maxLength: widget.maxLength,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 30.0,
                color: Colors.black),
            textCapitalization: widget.textCapitalization,
            controller: widget.controller,
            keyboardType: widget.keyBoardType,
            autofocus: widget.autoFocus,
            enabled: widget.enabled,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            validator: widget.validatorFunction,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                enabledBorder:
                    widget.enabledBorder == null ? null : widget.enabledBorder,
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
                suffix: widget.suffix,
                prefix: widget.prefix,
                counter: widget.maxLength == 1 ? Container() : null,
                counterText: "",
                errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: widget.color ?? Colors.white,
                hintText: widget.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                    color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}
