import 'package:flutter/material.dart';
import '../../core/values/values.dart';

class OutlinedButtonWithText extends StatelessWidget {
  final String content;
  final double width;
  final VoidCallback? onPressed;

  OutlinedButtonWithText(
      {Key? key, required this.content, required this.width, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        height: 40,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(HexColor.fromHex("#122037")),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(
                            color: HexColor.fromHex("122037"), width: 1)))),
            child: Center(
                child: Text(content,
                    style: TextStyle(
                        fontSize: 13,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 1.0),
                        ],
                        fontWeight: FontWeight.w500,
                        color: Colors.white)))));
  }
}
