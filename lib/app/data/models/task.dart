import 'package:equatable/equatable.dart';

class Task extends Equatable{
  final String title;
  final int icon;
  final String color;
  final List<dynamic>? taskLists;

  const Task(
      {required this.title,
      required this.icon,
      required this.color,
      this.taskLists});

  // ?? you want to change some properties of the class on the go,
  // you can declare the copyWith method
  Task copyWith({
    String? title,
    int? icon,
    String? color,
    List<dynamic>? taskLists,
  }) =>
      Task(
          title: title ?? this.title,
          icon: icon ?? this.icon,
          color: color ?? this.color,
          taskLists: taskLists ?? this.taskLists);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
      title: json['title'],
      icon: json['icon'],
      color: json['color'],
      taskLists: json['taskLists']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': icon,
        'color': color,
        'taskLists': taskLists,
      };

  //?? used the equatable it's check and compared the task regarding title, icon, color
  @override
  List<Object?> get props => [title, icon, color];
}
