// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  int? indeces;
  String? id;
  String? title;
  String? desc;
  String? category;
  String? date;
  String? time;

  Task({
    this.indeces,
    this.id,
    this.title,
    this.desc,
    this.category,
    this.date,
    this.time,
  });

  Task copyWith({
    int? indeces,
    String? id,
    String? title,
    String? desc,
    String? category,
    String? date,
    String? time,
  }) {
    return Task(
      indeces: indeces ?? this.indeces,
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      category: category ?? this.category,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'indeces': indeces,
      'id': id,
      'title': title,
      'desc': desc,
      'category': category,
      'date': date,
      'time': time,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      indeces: map['indeces'] != null ? map['indeces'] as int : null,
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      time: map['time'] != null ? map['time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(indeces: $indeces, id: $id, title: $title, desc: $desc, category: $category, date: $date, time: $time)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.indeces == indeces &&
        other.id == id &&
        other.title == title &&
        other.desc == desc &&
        other.category == category &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode {
    return indeces.hashCode ^
        id.hashCode ^
        title.hashCode ^
        desc.hashCode ^
        category.hashCode ^
        date.hashCode ^
        time.hashCode;
  }
}
