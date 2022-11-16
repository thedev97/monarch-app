import 'package:flutter/material.dart';
import 'package:project_management_tool/app/widgets/background/white-background.dart';
import '../../core/values/values.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      WhiteBackground(
        color: HexColor.fromHex("#ffffff"),
        position: "topLeft",
      ),
      Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              /*TaskezAppHeader(
                title: "Chat",
                widget: AppAddIcon(),
              ),*/
              AppSpaces.verticalSpace20,
            ]),
          ))
    ]));
  }
}
