import 'package:flutter/material.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/core/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(
      IconData(
        personIconData,
        fontFamily: 'MaterialIcons',
      ),
      color: purple,
    ),
    Icon(
      IconData(workIcon, fontFamily: 'MaterialIcons'),
      color: pink,
    ),
    Icon(
      IconData(healthIcon, fontFamily: 'MaterialIcons'),
      color: orange,
    ),
    Icon(
      IconData(exerciseIcon, fontFamily: 'MaterialIcons'),
      color: red,
    ),
    Icon(
      IconData(movieIcon, fontFamily: 'MaterialIcons'),
      color: green,
    ),
    Icon(
      IconData(sportIcon, fontFamily: 'MaterialIcons'),
      color: yellow,
    ),
    Icon(
      IconData(travelIcon, fontFamily: 'MaterialIcons'),
      color: deepPink,
    ),
    Icon(
      IconData(shopIcon, fontFamily: 'MaterialIcons'),
      color: lightBlue,
    ),
  ];
}

