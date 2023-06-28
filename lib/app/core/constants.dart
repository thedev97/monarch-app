import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';
import '../data/data_model.dart';
import '../modules/calendar/calendar-screen/calendar_screen.dart';
import '../modules/dashboard/dashboard.dart';
import '../modules/projects/project-screen/projects.dart';
import '../modules/task/task-screen/task_screen.dart';
import '../widgets/stacked_images.dart';
import 'values/values.dart';

String tabSpace = "\t\t\t";

final List<Widget> screens = [
  Dashboard(),
  ProjectScreen(),
  CalendarScreen(),
  TaskScreen()
];

List<Color> progressCardGradient = [
  HexColor.fromHex("#fdf7e9"),
  HexColor.fromHex("#fdf7e9"),
  HexColor.fromHex("#fdf7e9"),
];

List<Color> progressCardGradientList = [
  HexColor.fromHex("87EFB5"),
  HexColor.fromHex("8ABFFC"),
  HexColor.fromHex("EEB2E8"),
];

Widget buildStackedImages(
    {TextDirection direction = TextDirection.rtl,
    String? numberOfMembers,
    bool? addMore}) {
  final double size = 50;
  final double xShift = 20;

  Container lastContainer = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Center(
        child: Text(numberOfMembers!,
            style: GoogleFonts.lato(
                color: HexColor.fromHex("226AFD"),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ));

  Container iconContainer = Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.primaryAccentColor, shape: BoxShape.circle),
      child: Icon(Icons.add, color: Colors.white));

  final items = List.generate(
      4,
      (index) => ProfileDummyImg(
          color: AppData.groupBackgroundColors[index],
          dummyType: ProfileDummyTypeImg.Image,
          image: AppData.profileImages[index],
          scale: 1.0));

  return StackedWidgets(
    direction: direction,
    items: [
      ...items,
      lastContainer,
      (addMore != null) ? iconContainer : SizedBox()
    ],
    size: size,
    xShift: xShift,
  );
}

