// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';


class Note {

  int id;


  String title;


  String content;


  DateTime modifiedTime;


  Note({

    required this.id,

    required this.title,

    required this.content,

    required this.modifiedTime,

  });


  static List<Note> sampleNotes = [];


// Add the notes to notes


  static addNotes(Note note) {

    sampleNotes.add(note);

  }


// Update notes


  static updateNotes(int indeces, Note newNote) {

    sampleNotes[indeces] = newNote;

  }


// Delete Notes


  static deleteNotes(int indeces) {

    sampleNotes.removeAt(indeces);

  }


  Note copyWith({

    int? id,

    String? title,

    String? content,

    DateTime? modifiedTime,

  }) {

    return Note(

      id: id ?? this.id,

      title: title ?? this.title,

      content: content ?? this.content,

      modifiedTime: modifiedTime ?? this.modifiedTime,

    );

  }


  Map<String, dynamic> toMap() {

    return <String, dynamic>{

      'id': id,

      'title': title,

      'content': content,

      'modifiedTime': modifiedTime.millisecondsSinceEpoch,

    };

  }


  factory Note.fromMap(Map<String, dynamic> map) {

    return Note(

      id: map['id'] as int,

      title: map['title'] as String,

      content: map['content'] as String,

      modifiedTime:

          DateTime.fromMillisecondsSinceEpoch(map['modifiedTime'] as int),

    );

  }


  String toJson() => json.encode(toMap());


  factory Note.fromJson(String source) =>

      Note.fromMap(json.decode(source) as Map<String, dynamic>);


  @override

  String toString() {

    return 'Note(id: $id, title: $title, content: $content, modifiedTime: $modifiedTime)';

  }


  @override

  bool operator ==(covariant Note other) {

    if (identical(this, other)) return true;


    return other.id == id &&

        other.title == title &&

        other.content == content &&

        other.modifiedTime == modifiedTime;

  }


  @override

  int get hashCode {

    return id.hashCode ^

        title.hashCode ^

        content.hashCode ^

        modifiedTime.hashCode;

  }

}

