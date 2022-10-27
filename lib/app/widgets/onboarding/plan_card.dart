import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants.dart';
import '../../core/values/values.dart';

class PlanCard extends StatelessWidget {
  int selectedIndex;
  ValueNotifier<int> notifierValue;

  final String header;
  final String subHeader;

  PlanCard(
      {Key? key,
      required this.selectedIndex,
      required this.notifierValue,
      required this.header,
      required this.subHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
          onTap: () {
            notifierValue.value = selectedIndex;
            print(notifierValue.value);
          },
          child: ValueListenableBuilder(
              valueListenable: notifierValue,
              builder: (BuildContext context, _, __) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: RadialGradient(
                        colors: [
                          ...progressCardGradientList,
                        ],
                        center: Alignment(1, 1),
                        focal: Alignment(0.3, -0.1),
                        focalRadius: 1.0,
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                      Text("🎉", style: TextStyle(fontSize: 40)),
                      AppSpaces.verticalSpace20,
                      Text(header,
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 1.0),
                              ],
                              fontSize: 24)),
                      AppSpaces.verticalSpace10,
                      Text(subHeader, style: GoogleFonts.lato()),
                          SizedBox(height: 20,),
                    ]));
              })),
    );
  }
}
