import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import 'TaskX.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GloblBloc {
  BehaviorSubject<List<TaskX>>? _taskList$;
  BehaviorSubject<List<TaskX>>? get taskList$ => _taskList$;

  GloblBloc() {
    _taskList$ = BehaviorSubject<List<TaskX>>.seeded([]);
    makeTaskList();
  }

  Future makeTaskList() async {
    SharedPreferences? sharedPref = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedPref.getStringList("TaskX");
    List<TaskX> prefUser = [];

    if (jsonList == null) {
      return;
    } else {
      for (String JsonTask in jsonList) {
        dynamic userMap = jsonDecode(JsonTask);
        TaskX temTask = TaskX.fromJson(userMap);
        prefUser.add(temTask);
      }
      _taskList$!.add(prefUser);
    }
  }

  void dispose() {
    _taskList$!.close();
  }
}
