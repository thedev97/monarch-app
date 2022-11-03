import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/values/values.dart';
import '../../../data/data_model.dart';
import '../../../widgets/dashboard/overview_task_container.dart';
import '../../../widgets/dashboard/task_progress_card.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tasksList(),
        AppSpaces.verticalSpace20,
        Text("Recent Activity",
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 20,
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0),
              ],
              fontWeight: FontWeight.w800,
            )),
        AppSpaces.verticalSpace20,
        OverviewTaskContainer(),
      ],
    );
  }

  //?? tasks list
  Widget tasksList() {
    var sizeHeight = Get.height;
    return Container(
      height: sizeHeight * 0.15,
      child: taskListCard(),
    );
  }

  // ??  task List card
  Widget taskListCard() {
    final dynamic data = AppData.progressIndicatorList;
    var sizeWidth = Get.width;
    return GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: AppData.progressIndicatorList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisSpacing: 15.0, mainAxisExtent: sizeWidth*0.65),
        itemBuilder: (BuildContext context, int index) {
          return TaskProgressCard(
            cardTitle: data[index]['cardTitle'],
            rating: data[index]['rating'],
            progressFigure: data[index]['progress'],
            percentageGap: int.parse(data[index]['progressBar']),
          );
        });
  }
}
