import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/core/values/sizes.dart';

import '../../core/values/strings.dart';

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      notifier.value = itemIndex;
                      if (callback != null) {
                        callback!();
                      }
                    },
                    child: Text(buttonText,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                  color: notifier.value == itemIndex
                                      ? primaryColor
                                      : Colors.transparent,
                                  offset: notifier.value == itemIndex
                                      ? Offset(0.0, 0.5)
                                      : Offset(0.0, 0.0),
                                  blurRadius:
                                      notifier.value == itemIndex ? 0.5 : 0.0),
                            ],
                            color: Colors.black))),
                Container(
                  height: 1,
                  width: buttonText == productivityViewTxt
                      ? sizeWidth * 0.25
                      : sizeWidth * 0.2,
                  decoration: BoxDecoration(
                      color: notifier.value == itemIndex
                          ? primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                )
              ],
            );
          }),
    );
  }
}
