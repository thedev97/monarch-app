import 'package:flutter/material.dart';

import '../core/values/values.dart';

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

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
      "mentionedBy": "Danny",
      "read": false,
      "date": "2 minutes ago",
      "profileImage": "assets/emoji/avatar-1.png",
      "color": "BBF1C3",
      "message": "Started following you"
    },
    {
      "mentionedBy": "Lenda",
      "date": "15 minutes ago",
      "read": false,
      "profileImage": "assets/emoji/avatar-4.png",
      "color": "FAA3FF",
      "message": "Started following you"
    },
    {
      "mentionedBy": "Jackson Ramos",
      "read": true,
      "date": "1.5 hours ago",
      "profileImage": "assets/emoji/avatar-3.png",
      "color": "FFC5D5",
      "message":
          "Please try to complete this functionality as soon as possible."
    },
    {
      "mentionedBy": "Katharine Walls",
      "read": true,
      "date": "2 hours ago",
      "profileImage": "assets/emoji/avatar-5.png",
      "color": "DBCFFE",
      "message": "New task added in BMC"
    },
    {
      "mentionedBy": "Bertha Ramos",
      "read": true,
      "date": "5 days ago",
      "profileImage": "assets/emoji/avatar-1.png",
      "color": "FFC5D5",
      "message": "Moved to 235 task to done"
    },
  ];

  static final List<Map<String, dynamic>> taskList = [
    {
      "name": "Gareth Reid",
      "taskImage": "assets/task-img.png",
      "time": "27/05/2023",
      "isActive": true,
      "message": "Fix the crash issues in location screen.",
      "status": "In Progress",
      "project": "HobNob"
    },
    {
      "name": "Vincent Lyons",
      "taskImage": "assets/task-img.png",
      "time": "05/06/2023",
      "isActive": false,
      "message": "Please fix these bugs..",
      "status": "Done",
      "project": "HobNob"
    },
    {
      "name": "Adeline Nunez",
      "taskImage": "assets/task-img.png",
      "time": "09/06/2023",
      "isActive": true,
      "message": "This flow is wrong....",
      "status": "In Progress",
      "project": "ABHA"
    },
    {
      "name": "Samuel Doyle",
      "taskImage": "assets/task-img.png",
      "time": "12/06/2023",
      "isActive": true,
      "message": "Hi shall we connect to discuss",
      "status": "In Progress",
      "project": "Monarch"
    },
    {
      "name": "Katherine Wells",
      "taskImage": "assets/task-img.png",
      "time": "12/06/2023",
      "isActive": true,
      "message": "Later we'll connect...",
      "status": "In Progress",
      "project": "HobNob"
    },
    {
      "name": "Chris Owens",
      "taskImage": "assets/task-img.png",
      "time": "15/06/2023",
      "isActive": false,
      "message": "Pushed the latest code in to your repo.",
      "status": "In Progress",
      "project": "ABHA"
    },
    {
      "name": "Laura Dallas",
      "taskImage": "assets/task-img.png",
      "time": "17/06/2023",
      "isActive": false,
      "message": "Please work on the UI part.",
      "status": "Done",
      "project": "Monarch"
    },
    {
      "name": "Isabella Ramos",
      "taskImage": "assets/task-img.png",
      "time": "18/06/2023",
      "isActive": false,
      "message": "Please work on the api implementation part.",
      "status": "In Progress",
      "project": "ABHA"
    },
    {
      "name": "Ruth Benson",
      "taskImage": "assets/task-img.png",
      "time": "21/06/2023",
      "isActive": true,
      "message": "Please learn the advanced level...",
      "status": "In Progress",
      "project": "Internal Task"
    },
  ];

  static final List<String> profileImages = [
    "assets/emoji/avatar-5.png",
    "assets/emoji/avatar-1.png",
    "assets/emoji/avatar-2.png",
    "assets/emoji/avatar-4.png",
  ];

  static final List<String> notificationSectionList = [
    "Active",
    "Do not disturb",
  ];

  static final List<String> donotDisturbList = [
    "30 mins",
    "50 mins",
    "1 day",
    "Custom"
  ];

  static final List<String> notifyMyAbout = [
    "Task assign to me",
    "Task completed",
    "Mentioned me",
    "Direct message"
  ];

  static final List<String> myProjectList = [
    "Hobnob",
    "Monarch",
    "MIS Portal",
    "BG Team",
    "Internal Task"
  ];

  static final List<Color> groupBackgroundColors = [
    HexColor.fromHex("BCF2C7"),
    HexColor.fromHex("8D96FF"),
    HexColor.fromHex("A5F69C"),
    HexColor.fromHex("FCA3FF")
  ];

  static final List<String> priorityList = [
    'High Priority',
    'Medium Priority',
    'Low Priority'
  ];

  static final List<String> taskTypeList = [
    'Story Type',
    'Task Type',
    'Bugs Type'
  ];

  static final List<String> addProjectList = [
    'HobNob',
    'Bg Desk',
    'Monarch',
    'MIS Portal',
    'Chronos',
    'Internal Task'
  ];

  static final List<Map<String, dynamic>> directReportList = [
    {
      "empName": "Katharine Walls",
      "profileImage": "assets/dummy-img.png",
      "empCode": "BHS0011",
      "contactNum": "+91-9345814690",
    },
    {
      "empName": "Vincent Lyons",
      "profileImage": "assets/dummy-img.png",
      "empCode": "BHS0012",
      "contactNum": "+91-7345814692",
    },
    {
      "empName": "Jackson Ramos",
      "profileImage": "assets/emoji/avatar-2.png",
      "empCode": "BHS0013",
      "contactNum": "+91-8345814636",
    },
  ];

  static final List<Map<String, dynamic>> activeProjectList = [
    {
      "projectName": "HobNob",
      "progressValue": 0.3,
      "color": "001E88",
      "time": "13:00 PM",
      "isActive": true,
      "desc": "Claim initiation issue please check and let me know",
    },
    {
      "projectName": "Bg Desk",
      "progressValue": 0.7,
      "color": "FFFFF",
      "time": "1 day ago",
      "isActive": false,
      "desc": "Claim initiation issue please check and let me know",
    },
    {
      "projectName": "Mobile app",
      "progressValue": 0.8,
      "color": "FFFFF",
      "time": "11:00 AM",
      "isActive": false,
      "desc": "Claim initiation issue please check and let me know",
    },
    {
      "projectName": "MIS Portal",
      "progressValue": 0.5,
      "color": "FFFFF",
      "time": "07:30 AM",
      "isActive": false,
      "desc": "Claim initiation issue please check and let me know",
    },
  ];

  static final List<Map<String, dynamic>> allProjectList = [
    {
      "projectName": "HobNob",
      "color": "001E88",
    },
    {
      "projectName": "Bimagarage",
      "color": "87C76F",
    },
    {
      "projectName": "Fresha",
      "color": "001E88",
    },
    {
      "projectName": "MIS Portal",
      "color": "899FFE",
    },
    {
      "projectName": "Monarch",
      "color": "FFD996",
    },
    {
      "projectName": "Internal Task",
      "color": "C395FC",
    },
    {
      "projectName": "ABHA M1",
      "color": "001E88",
    },
    {
      "projectName": "ABHA M3",
      "color": "1E2027",
    },
    {
      "projectName": "Chronos",
      "color": "87D3DF",
    },
    {
      "projectName": "RZP",
      "color": "E67E22",
    },
    {
      "projectName": "Blaze",
      "color": "F1A39A",
    },
  ];

  static final List<Map<String, dynamic>> chatUsers = [
    {
      "name": "Gareth Reid",
      "profileImage": "assets/emoji/avatar-1.png",
      "color": "BAF0C5",
      "time": "3m ago",
      "isActive": true,
      "lastMessage": "Meeting is over..",
    },
    {
      "name": "Vincent Lyons",
      "profileImage": "assets/emoji/avatar-2.png",
      "color": "DACFFE",
      "time": "10m ago",
      "isActive": false,
      "lastMessage": "When you start ?",
    },
    {
      "name": "Adeline Nunez",
      "profileImage": "assets/emoji/avatar-3.png",
      "color": "FFC7D5",
      "time": "1hour ago",
      "isActive": true,
      "lastMessage": "Project is added.",
    },
    {
      "name": "Samuel Doyle",
      "profileImage": "assets/emoji/avatar-4.png",
      "color": "C0E7FD",
      "time": "1hour ago",
      "isActive": false,
      "lastMessage": "You did well buddy.",
    },
    {
      "name": "Ruth Benson",
      "profileImage": "assets/emoji/avatar-5.png",
      "color": "D7D2D4",
      "time": "1hour ago",
      "isActive": true,
      "lastMessage": "Bug is fixed now please check it..",
    },
    {
      "name": "Adeline Nunez",
      "profileImage": "assets/emoji/avatar-1.png",
      "color": "FFC7D5",
      "time": "1hour ago",
      "isActive": true,
      "lastMessage": "This isn't good",
    },
    {
      "name": "Samuel Doyle",
      "profileImage": "assets/emoji/avatar-4.png",
      "color": "C0E7FD",
      "time": "1hour ago",
      "isActive": false,
      "lastMessage": "Bye...",
    },
    {
      "name": "Adeline Nunez",
      "profileImage": "assets/emoji/avatar-5.png",
      "color": "FFC7D5",
      "time": "12hour ago",
      "isActive": true,
      "lastMessage": "Hi, Are you there !!",
    },
  ];

  static final List<Map<String, dynamic>> chatMessages = [
    {
      "message": "Hi Soumya,\nLet me know when you are free",
      "messageType": ChatMessageType.text,
      "messageStatus": MessageStatus.viewed,
      "isSender": false,
    },
    {
      "message": "What's up buddy!!",
      "messageType": ChatMessageType.text,
      "messageStatus": MessageStatus.viewed,
      "isSender": true,
    },
    {
      "message": "I'm good what about you..",
      "messageType": ChatMessageType.text,
      "messageStatus": MessageStatus.viewed,
      "isSender": false,
    },
    {
      "message": "I'm free. let's connect",
      "messageType": ChatMessageType.text,
      "messageStatus": MessageStatus.not_sent,
      "isSender": true,
    },
    {
      "message": "Okay",
      "messageType": ChatMessageType.text,
      "messageStatus": MessageStatus.not_view,
      "isSender": false,
    },
  ];

  static final List<Map<String, dynamic>> employeeDevData = [
    {
      "designation": "Development",
      "employeeName": "Laura Dallas",
      "employeeImage": "assets/emoji/avatar-1.png",
      "color": HexColor.fromHex("FCA3FF"),
      "activated": false,
      "employeePosition": "Senior Developer"
    },
    {
      "designation": "Development",
      "employeeName": "Franklin Walls",
      "employeeImage": "assets/team-prof.png",
      "color": HexColor.fromHex("FCA3FF"),
      "activated": false,
      "employeePosition": "Project Manager"
    },
    {
      "designation": "Development",
      "employeeName": "Chris Owens",
      "employeeImage": "assets/emoji/avatar-2.png",
      "color": HexColor.fromHex("94F1F1"),
      "activated": false,
      "employeePosition": "DataBase Engineer"
    },
    {
      "designation": "Development",
      "employeeName": "Ramos Sergio",
      "employeeImage": "assets/emoji/avatar-3.png",
      "color": HexColor.fromHex("8D96FF"),
      "activated": false,
      "employeePosition": "Senior Developer"
    },
  ];
  static final List<Map<String, dynamic>> employeeAdminData = [
    {
      "designation": "Admin",
      "employeeName": "Katherine Wells",
      "employeeImage": "assets/emoji/avatar-4.png",
      "color": HexColor.fromHex("DBD0FD"),
      "activated": false,
      "employeePosition": "UI Designer"
    },
    {
      "designation": "Admin",
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
