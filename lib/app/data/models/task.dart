import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Task extends Equatable {
  final String title;
  final Icon saveIcon;
  final Color color;
  final String taskDes;
  final Image projectLogo;
  final List<dynamic>? taskLists;

  const Task(
      {required this.title,
      required this.saveIcon,
      required this.color,
      required this.taskDes,
      required this.projectLogo,
      this.taskLists});

  // ?? you want to change some properties of the class on the go,
  // you can declare the copyWith method
  Task copyWith({
    String? title,
    Icon? saveIcon,
    Color? color,
    String? taskDes,
    Image? projectLogo,
    List<dynamic>? taskLists,
  }) =>
      Task(
          title: title ?? this.title,
          saveIcon: saveIcon ?? this.saveIcon,
          color: color ?? this.color,
          taskDes: taskDes ?? this.taskDes,
          projectLogo: projectLogo ?? this.projectLogo,
          taskLists: taskLists ?? this.taskLists);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      title: json['title'],
      saveIcon: json['icon'],
      color: json['color'],
      taskDes: json['taskDes'],
      projectLogo: json['projectLogo'],
      taskLists: json['taskLists']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': saveIcon,
        'color': color,
        'taskDes': taskDes,
        'projectLogo': projectLogo,
        'taskLists': taskLists,
      };

  //?? used the equatable it's check and
  // compared the task regarding title, icon, color, task description
  // and project logo
  @override
  List<Object?> get props => [title, saveIcon, color, taskDes, projectLogo];
}
