import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';

class PrimaryTabButton extends StatelessWidget {
  final String buttonText;
  final int itemIndex;
  final ValueNotifier<int> notifier;
  final VoidCallback? callback;

  const PrimaryTabButton(
      {Key? key,
      this.callback,
      required this.notifier,
      required this.buttonText,
      required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, _, __) {
            return ElevatedButton(
                onPressed: () {
                  notifier.value = itemIndex;
                  if (callback != null) {
                    callback!();
                  }
                },
                style: ButtonStyle(
                    backgroundColor: notifier.value == itemIndex
                        ? MaterialStateProperty.all<Color>(
                            Colors.white)
                        : MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: notifier.value == itemIndex
                                ? BorderSide(color: Colors.black)
                                : BorderSide(color: Colors.grey)))),
                child: Text(buttonText,
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                              color: notifier.value == itemIndex ? Colors.black : Colors.transparent,
                              offset: notifier.value == itemIndex
                                  ? Offset(0.0, 1.0)
                                  : Offset(0.0, 0.0),
                              blurRadius:
                                  notifier.value == itemIndex ? 1.0 : 0.0),
                        ],
                        fontWeight: FontWeight.w500)));
          }),
    );
  }
}
