import 'package:hive_flutter/hive_flutter.dart';
import 'package:stu_pedia/task_manager_module/data/TaskData.dart';
import 'package:stu_pedia/task_manager_module/models/Task.dart';

class HiveDataTask {
  static final taskHive = Hive.box("tasks");

  // add task to task data to hive
  static Future<void> addNotesDataToHive(Map<String, dynamic> taskAsMap) async {
    await taskHive.add(taskAsMap);
    fetchTaskDataFromHive();
    // print("Lenth of data: ${taskHive.length}");
    // print(taskHive.toMap().toString());
  }

  // update Task to hive
  static Future<void> updateTaskToHive(
      int key, Map<String, dynamic> task) async {
    await taskHive.put(key, task);
    // print("lenght of notes data in hive: ${notesHive.length}");
    fetchTaskDataFromHive();
  }

  // update notes to hive
  static Future<void> deleteTaskToHive(int key) async {
    await taskHive.delete(key);
    // print("lenght of notes data in hive: ${notesHive.length}");
    fetchTaskDataFromHive();
  }

  //fetch data task
  // fetch data from hive
  static void fetchTaskDataFromHive() {
    final List<Task> data = taskHive.keys.map((key) {
      final task = taskHive.get(key);

      return Task(
        indeces: key,
        id: task["id"],
        title: task["title"],
        desc: task["desc"],
        category: task["category"],
        date: task["date"],
        time: task["time"],
      );
    }).toList();

    print(data.toString());
    TaskData.taskList = data.toList();
  }
}
