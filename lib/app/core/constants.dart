import 'package:flutter/material.dart';
import '../modules/dashboard/dashboard.dart';
import '../modules/dashboard/notifications.dart';
import '../modules/dashboard/projects.dart';
import '../modules/dashboard/search_screen.dart';
import 'values/values.dart';

String tabSpace = "\t\t\t";

final List<Widget> dashBoardScreens = [
  Dashboard(),
  ProjectScreen(),
  NotificationScreen(),
  SearchScreen()
];

List<Color> progressCardGradient = [
  //green
  HexColor.fromHex("#fdf7e9"),
  //blue
  HexColor.fromHex("#fdf7e9"),
  //pink
  HexColor.fromHex("#fdf7e9"),
];

List<Color> progressCardGradientList = [
//grenn
  HexColor.fromHex("87EFB5"),
//blue
  HexColor.fromHex("8ABFFC"),
//pink
  HexColor.fromHex("EEB2E8"),
];

/*
final onlineUsers = List.generate(
    AppData.onlineUsers.length,
        (index) => OnlineUser(
      image: AppData.onlineUsers[index]['profileImage'],
      imageBackground: AppData.onlineUsers[index]['color'],
      userName: AppData.onlineUsers[index]['name'],
    ));*/
