// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RoutineItemData {
  String startTime = "";
  String endTime = "";
  String description = "";
  RoutineItemData({
    required this.startTime,
    required this.endTime,
    required this.description,
  });

  RoutineItemData copyWith({
    String? startTime,
    String? endTime,
    String? description,
  }) {
    return RoutineItemData(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
    };
  }

  factory RoutineItemData.fromMap(Map<String, dynamic> map) {
    return RoutineItemData(
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutineItemData.fromJson(String source) =>
      RoutineItemData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RoutineItemData(startTime: $startTime, endTime: $endTime, description: $description)';

  @override
  bool operator ==(covariant RoutineItemData other) {
    if (identical(this, other)) return true;

    return other.startTime == startTime &&
        other.endTime == endTime &&
        other.description == description;
  }

  @override
  int get hashCode =>
      startTime.hashCode ^ endTime.hashCode ^ description.hashCode;
}
