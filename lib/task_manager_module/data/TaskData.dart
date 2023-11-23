import 'package:stu_pedia/task_manager_module/models/Task.dart';

class TaskData {
  static List<Task> taskList = [];

  static addTask(
      String title, String desc, String? category, String? date, String? time) {
    taskList.add(Task(
        title: title, category: category, desc: desc, date: date, time: time));
  }

  static updateTask(int updateind, String title, String desc, String? category,
      String? date, String? time) {
    taskList[updateind] = Task(
        title: title, category: category, desc: desc, date: date, time: time);
  }
}
