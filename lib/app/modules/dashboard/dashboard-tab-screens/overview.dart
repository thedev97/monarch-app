import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';
import '../../../core/values/values.dart';
import '../../../data/data_model.dart';
import '../../../widgets/dashboard/overview_task_container.dart';
import '../../../widgets/dashboard/task_progress_card.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic data = AppData.progressIndicatorList;
    var sizeWidth = MediaQuery.of(context).size.width;
    List<Widget> cards = List.generate(
        5,
        (index) => TaskProgressCard(
              cardTitle: data[index]['cardTitle'],
              rating: data[index]['rating'],
              progressFigure: data[index]['progress'],
              percentageGap: int.parse(data[index]['progressBar']),
            ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: sizeWidth,
          child: TCard(
            cards: cards,
          ),
        ),
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
}
