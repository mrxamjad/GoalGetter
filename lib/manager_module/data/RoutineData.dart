// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:stu_pedia/manager_module/data/RoutinItem.dart';

class RoutineData {
  int? id;
  String routineTitle = "";
  List<RoutineItemData> routineItemList = [];
  RoutineData({
    this.id,
    required this.routineTitle,
    required this.routineItemList,
  });

  RoutineData copyWith({
    int? id,
    String? routineTitle,
    List<RoutineItemData>? routineItemList,
  }) {
    return RoutineData(
      id: id ?? this.id,
      routineTitle: routineTitle ?? this.routineTitle,
      routineItemList: routineItemList ?? this.routineItemList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'routineTitle': routineTitle,
      'routineItemList': routineItemList.map((x) => x.toMap()).toList(),
    };
  }

  factory RoutineData.fromMap(Map<String, dynamic> map) {
    return RoutineData(
      id: map['id'] != null ? map['id'] as int : null,
      routineTitle: map['routineTitle'] as String,
      routineItemList: List<RoutineItemData>.from(
        (map['routineItemList'] as List<int>).map<RoutineItemData>(
          (x) => RoutineItemData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutineData.fromJson(String source) =>
      RoutineData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RoutineData(id: $id, routineTitle: $routineTitle, routineItemList: $routineItemList)';

  @override
  bool operator ==(covariant RoutineData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.routineTitle == routineTitle &&
        listEquals(other.routineItemList, routineItemList);
  }

  @override
  int get hashCode =>
      id.hashCode ^ routineTitle.hashCode ^ routineItemList.hashCode;

  // Create List of routine
  static List<RoutineData> routineList = [];

  //add routine to Routine List
  static addRoutine(
      String routineTitle, List<RoutineItemData> routineItemList) {
    routineList.add(RoutineData(
        routineTitle: routineTitle, routineItemList: routineItemList));
  }

  static updateRoutine(
      int indeces, String routineTitle, List<RoutineItemData> routineItemList) {
    routineList[indeces] = RoutineData(
        routineTitle: routineTitle, routineItemList: routineItemList);
  }
}
