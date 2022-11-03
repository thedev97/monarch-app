import 'package:flutter/material.dart';

import '../core/values/values.dart';

class AppData {
  static final List<Map<String, dynamic>> progressIndicatorList = [
    {
      "cardTitle": "Fixed The Bug Issues",
      "rating": "3/5",
      "progress": "68.99",
      "progressBar": "2"
    },
    {
      "cardTitle": "Worked on Registration Section",
      "rating": "3/4",
      "progress": "75.00",
      "progressBar": "3"
    },
    {
      "cardTitle": "Invite 5 Members Using Email Parsing",
      "rating": "2/5",
      "progress": "50",
      "progressBar": "1"
    },
    {
      "cardTitle": "Worked on Profile Section",
      "rating": "3/4",
      "progress": "75",
      "progressBar": "3"
    },
    {
      "cardTitle": "Update the Clockify",
      "rating": "3/5",
      "progress": "68.99",
      "progressBar": "2"
    },
  ];

  static final List<Map<String, dynamic>> notificationMentions = [
    {
      "mentionedBy": "Danny-Wills",
      "mentionedIn": "HobNob",
      "read": false,
      "date": "Nov 2nd",
      "profileImage": "assets/emoji/avatar-1.png",
      "hashTagPresent": true,
      "userOnline": false,
      "color": "BBF1C3",
      "hashElement": "@soumya",
      "message":
          "When you have time please take a look at the new designs I just made in Figma."
    },
    {
      "mentionedBy": "Franklin-Walls",
      "mentionedIn": "HobNob",
      "read": true,
      "date": "Nov 2nd",
      "profileImage": "assets/emoji/avatar-2.png",
      "hashTagPresent": false,
      "color": "DBCFFE",
      "userOnline": true,
      "hashElement": "",
      "message": "Please fixed this bug asap."
    },
    {
      "mentionedBy": "Jackson Ramos",
      "mentionedIn": "UI5 Products",
      "read": true,
      "date": "Nov 2nd",
      "profileImage": "assets/emoji/avatar-3.png",
      "hashTagPresent": false,
      "userOnline": true,
      "color": "FFC5D5",
      "hashElement": "",
      "message":
          "Please try to complete this functionality as soon as possible."
    },
    {
      "mentionedBy": "Sophie Brownie",
      "mentionedIn": "Productivity",
      "date": "Nov 2nd",
      "read": true,
      "profileImage": "assets/emoji/avatar-4.png",
      "hashTagPresent": false,
      "color": "FAA3FF",
      "userOnline": false,
      "hashElement": "",
      "message": "Please update your task on regular basis."
    },
    {
      "mentionedBy": "Katharine Walls",
      "mentionedIn": "UI5 Products",
      "read": true,
      "date": "Nov 2nd",
      "profileImage": "assets/emoji/avatar-5.png",
      "hashTagPresent": false,
      "color": "DBCFFE",
      "userOnline": true,
      "hashElement": "",
      "message": "Hey Please be online."
    },
    {
      "mentionedBy": "Bertha Ramos",
      "mentionedIn": "DataBase-Handler",
      "read": true,
      "date": "Nov 2nd",
      "profileImage": "assets/emoji/avatar-1.png",
      "hashTagPresent": false,
      "userOnline": true,
      "color": "FFC5D5",
      "hashElement": "",
      "message": "Hey, Please stored the login data in locally. It's Important."
    },
    {
      "mentionedBy": "Marie Bowen",
      "mentionedIn": "Productivity",
      "date": "Nov 2nd",
      "read": true,
      "profileImage": "assets/emoji/avatar-4.png",
      "hashTagPresent": false,
      "color": "FAA3FF",
      "userOnline": false,
      "hashElement": "",
      "message": "We are meeting at 4 pm. so please available."
    },
  ];

  static final List<String> profileImages = [
    "assets/emoji/avatar-1.png",
    "assets/emoji/avatar-2.png",
    "assets/emoji/avatar-4.png",
    "assets/emoji/avatar-5.png",
  ];

  static final List<Color> groupBackgroundColors = [
    HexColor.fromHex("BCF2C7"),
    HexColor.fromHex("8D96FF"),
    HexColor.fromHex("A5F69C"),
    HexColor.fromHex("FCA3FF")
  ];

  static final List<Map<String, dynamic>> onlineUsers = [
    {
      "name": "Gareth Reid 🔥",
      "profileImage": "assets/emoji/avatar-1.png",
      "color": "BAF0C5",
    },
    {
      "name": "Vincent Lyons 🇺🇸",
      "profileImage": "assets/emoji/avatar-2.png",
      "color": "DACFFE",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage": "assets/emoji/avatar-3.png",
      "color": "FFC7D5",
    },
    {
      "name": "Samuel Doyle 🔥",
      "profileImage": "assets/emoji/avatar-4.png",
      "color": "C0E7FD",
    },
    {
      "name": "Ruth Benson 🔥",
      "profileImage": "assets/emoji/avatar-5.png",
      "color": "D7D2D4",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage": "assets/emoji/avatar-1.png",
      "color": "FFC7D5",
    },
    {
      "name": "Samuel Doyle 🔥",
      "profileImage": "assets/emoji/avatar-4.png",
      "color": "C0E7FD",
    },
    {
      "name": "Ruth Benson 🔥",
      "profileImage": "assets/emoji/avatar-2.png",
      "color": "D7D2D4",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage": "assets/emoji/avatar-5.png",
      "color": "FFC7D5",
    },
    {
      "name": "Samuel Doyle 🔥",
      "profileImage": "assets/emoji/avatar-3.png",
      "color": "C0E7FD",
    },
    {
      "name": "Ruth Benson 🔥",
      "profileImage": "assets/emoji/avatar-2.png",
      "color": "D7D2D4",
    },
    {
      "name": "Gareth Reid 🔥",
      "profileImage": "assets/emoji/avatar-4.png",
      "color": "BAF0C5",
    },
    {
      "name": "Vincent Lyons 🇺🇸",
      "profileImage": "assets/emoji/avatar-5.png",
      "color": "DACFFE",
    },
    {
      "name": "Adeline Nunez 🎉",
      "profileImage": "assets/emoji/avatar-1.png",
      "color": "FFC7D5",
    },
  ];

  static final List<Map<String, dynamic>> employeeData = [
    {
      "employeeName": "Laura Dallas",
      "employeeImage": "assets/emoji/avatar-1.png",
      "color": HexColor.fromHex("FCA3FF"),
      "activated": false,
      "employeePosition": "Senior Developer"
    },
    {
      "employeeName": "Franklin Walls",
      "employeeImage": "assets/team-prof.png",
      "color": HexColor.fromHex("FCA3FF"),
      "activated": false,
      "employeePosition": "Project Manager"
    },
    {
      "employeeName": "Chris Owens",
      "employeeImage": "assets/emoji/avatar-2.png",
      "color": HexColor.fromHex("94F1F1"),
      "activated": false,
      "employeePosition": "DataBase Engineer"
    },
    {
      "employeeName": "Ramos Sergio",
      "employeeImage": "assets/emoji/avatar-3.png",
      "color": HexColor.fromHex("8D96FF"),
      "activated": false,
      "employeePosition": "Senior Developer"
    },
    {
      "employeeName": "Katherine Wells",
      "employeeImage": "assets/emoji/avatar-4.png",
      "color": HexColor.fromHex("DBD0FD"),
      "activated": false,
      "employeePosition": "UI Designer"
    },
    {
      "employeeName": "Isabella Ramos",
      "employeeImage": "assets/emoji/avatar-5.png",
      "color": HexColor.fromHex("FFC5D5"),
      "activated": false,
      "employeePosition": "Backend Developer"
    },
    {
      "employeeName": "Bryce Sermon",
      "employeeImage": "assets/emoji/avatar-4.png",
      "color": HexColor.fromHex("94F1F1"),
      "activated": false,
      "employeePosition": "Product Manager"
    },
    {
      "employeeName": "Ramos Sergio",
      "employeeImage": "assets/emoji/avatar-3.png",
      "color": HexColor.fromHex("FCA3FF"),
      "activated": false,
      "employeePosition": "Senior Developer"
    },
    {
      "employeeName": "Chris Owens",
      "employeeImage": "assets/emoji/avatar-2.png",
      "color": HexColor.fromHex("FCA3FF"),
      "activated": false,
      "employeePosition": "DataBase Engineer"
    },
  ];

  static final List<Map<String, dynamic>> productData = [
    {
      "projectName": "Unity Dashboard",
      "category": "Design",
      "color": "A06AFA",
      "ratingsUpperNumber": 15,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "Instagram   Shots🇺🇸",
      "category": "Marketing",
      "color": "8D96FF",
      "ratingsUpperNumber": 8,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "Cubbies",
      "category": "Design",
      "color": "FF968E",
      "ratingsUpperNumber": 15,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "OpenMind 🚀",
      "category": "Development",
      "color": "FFDE72",
      "ratingsUpperNumber": 19,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "UI8 Platform",
      "category": "Design",
      "color": "A06AFA",
      "ratingsUpperNumber": 10,
      "ratingsLowerNumber": 20
    },
    {
      "projectName": "3D Characters Inc.",
      "category": "Development",
      "color": "A6F69C",
      "ratingsUpperNumber": 18,
      "ratingsLowerNumber": 20
    },
  ];
}
