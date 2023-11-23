import 'package:hive_flutter/hive_flutter.dart';
import 'package:stu_pedia/notes_module/models/note.dart';

class HiveClassNotes {
  static final notesHive = Hive.box("notes");

  // add notes to hive
  static Future<void> addNoteToHive(Map<String, dynamic> note) async {
    await notesHive.add(note);
    // print("lenght of notes data in hive: ${notesHive.length}");
    fetchNotesDataFromHive();
  }

  // update notes to hive
  static Future<void> updateNoteToHive(
      int key, Map<String, dynamic> note) async {
    await notesHive.put(key, note);
    // print("lenght of notes data in hive: ${notesHive.length}");
    fetchNotesDataFromHive();
  }

  // update notes to hive
  static Future<void> deleteNoteToHive(int key) async {
    await notesHive.delete(key);
    // print("lenght of notes data in hive: ${notesHive.length}");
    fetchNotesDataFromHive();
  }

  // fetch data from hive
  static void fetchNotesDataFromHive() {
    final List<Note> data = notesHive.keys.map((key) {
      final note = notesHive.get(key);

      return Note(
          id: key,
          title: note["title"],
          content: note["content"],
          modifiedTime:
              DateTime.fromMillisecondsSinceEpoch(note["modifiedTime"] as int));
    }).toList();

    // print(data.toList().toString());
    Note.sampleNotes = data.reversed.toList();
  }
}
