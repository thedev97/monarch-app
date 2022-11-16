import 'package:flutter/material.dart';
import 'package:project_management_tool/app/widgets/dashboard/place-info.dart';

import '../../core/values/values.dart';

class OverviewTaskContainer extends StatelessWidget {
  OverviewTaskContainer({Key? key}) : super(key: key);

  final double _borderRadius = 15;

  var items = [
    PlaceInfo('TASK WORK IN PROGRESS', Color(0xffFF5B95), Color(0xffF8556D), 1,
        'WIP'),
    PlaceInfo('PENDING TASK', Color(0xffFFB157), Color(0xffFFA057), 2,
        'Pending Task*'),
    PlaceInfo('TASK COMPLETED', Color(0xff42E695), Color(0xff3BB2B8), 2,
        'Task Completed'),
    PlaceInfo('TOTAL TASKS', Color(0xffD76EF5), Color(0xff8F7AFE), 5,
        'All Tasks'),
    PlaceInfo('TOTAL PROJECTS', Color(0xff6DC8F3), Color(0xff73A1F9),
        1, 'All Projects'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(colors: [
                        items[index].startColor,
                        items[index].endColor
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: items[index].endColor,
                          blurRadius: 2,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CustomPaint(
                      size: Size(100, 150),
                      painter: CustomCardShapePainter(_borderRadius,
                          items[index].startColor, items[index].endColor),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            'assets/compl-task.png',
                            height: 42,
                            width: 42,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                              AppSpaces.verticalSpace10,
                              Text(
                                items[index].category,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                items[index].rating.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Avenir',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              //RatingBar(rating: items[index].rating),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
