import 'package:Monarch/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final int itemIndex;

  final ValueNotifier<int> notifier;

  BottomNavigationItem(
      {Key? key,
      required this.itemIndex,
      required this.notifier,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          notifier.value = itemIndex;
        },
        child: ValueListenableBuilder(
            valueListenable: notifier,
            builder: (BuildContext context, _, __) {
              return Stack(alignment: Alignment.center, children: [
                Positioned(
                    top: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon,
                            size: 25,
                            color: notifier.value != itemIndex
                                ? Colors.black
                                : primaryColor),
                        SizedBox(height: 10),
                        notifier.value != itemIndex
                            ? SizedBox(width: 30, height: 30)
                            : Transform.rotate(
                                angle: -math.pi / 4,
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: primaryColor)))
                      ],
                    )),
              ]);
            }),
      ),
    );
  }
}
