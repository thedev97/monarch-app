import 'package:flutter/material.dart';
import 'package:Monarch/app/core/values/colors.dart';

class BottomNavigationItem extends StatelessWidget {
  final String image;
  final int itemIndex;

  final ValueNotifier<int> notifier;

  BottomNavigationItem(
      {Key? key,
      required this.itemIndex,
      required this.notifier,
      required this.image})
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
                    child: Image.asset(image,
                        height: 25,
                        width: 25,
                        color: notifier.value != itemIndex
                            ? Colors.black
                            : primaryColor)),
              ]);
            }),
      ),
    );
  }
}
