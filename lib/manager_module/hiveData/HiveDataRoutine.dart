import 'package:hive_flutter/hive_flutter.dart';
import 'package:stu_pedia/manager_module/data/RoutinItem.dart';
import 'package:stu_pedia/manager_module/data/RoutineData.dart';

class HiveDataRoutine {
  static final routineHive = Hive.box("routines");

  // add task to task data to hive
  static Future<void> addRoutineDataToHive(
      Map<String, dynamic> routineAsMap) async {
    await routineHive.add(routineAsMap);
    fetchRoutineDataFromHive();
  }

  // update Task to hive
  static Future<void> updateRoutineToHive(
      int key, Map<String, dynamic> routine) async {
    await routineHive.put(key, routine);
    // print("lenght of notes data in hive: ${notesHive.length}");
    fetchRoutineDataFromHive();
  }

  // update notes to hive
  static Future<void> deleteRoutineToHive(int key) async {
    await routineHive.delete(key);
    // print("lenght of notes data in hive: ${notesHive.length}");
    fetchRoutineDataFromHive();
  }

  //fetch data task
  // fetch data from hive
  static void fetchRoutineDataFromHive() {
    final List<RoutineData> data = routineHive.keys.map((key) {
      final routine = routineHive.get(key);

      // Convert data to a list of RoutineItemList objects'

      List<dynamic> data = routine["routineItemList"];
      List<RoutineItemData> routineList = data.map<RoutineItemData>((item) {
        return RoutineItemData(
          startTime: item["startTime"],
          endTime: item["endTime"],
          description: item["description"],
        );
      }).toList();

      return RoutineData(
          id: key,
          routineTitle: routine['routineTitle'],
          routineItemList: routineList);
    }).toList();

    // print(data.toList().toString());
    RoutineData.routineList = data.reversed.toList();
  }
}
