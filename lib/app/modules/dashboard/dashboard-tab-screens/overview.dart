import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/core/values/sizes.dart';
import '../../../core/values/images.dart';
import '../../../core/values/strings.dart';
import '../../../core/values/values.dart';
import '../../../widgets/dashboard/overview_task_container.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecorationStyles.overViewDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Padding(
               padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(pendingTaskTxt, style: AppTextStyles.header1),
                   SizedBox(height: 10,),
                   Text(pendingTaskDesc, style: AppTextStyles.subHeader1),
                 ],
               ),
             ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 4, bottom: 4),
                child: SvgPicture.asset(overview_custom_painter_img, height: sizeHeight*0.15, width: sizeWidth*0.5,),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text(activityTaskTxt,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0),
                  ],
                  color: Colors.black)),
        ),
        AppSpaces.verticalSpace20,
        OverviewTaskContainer(),
      ],
    );
  }
}
