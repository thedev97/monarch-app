import 'package:project_management_tool/app/data/models/task.dart';
import 'package:project_management_tool/app/data/providers/task/provider.dart';

class TaskRepository{
  TaskProvider taskProvider;
  TaskRepository ({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTask();
  void writeTask(List<Task> tasks) => taskProvider.writeTask(tasks);
}