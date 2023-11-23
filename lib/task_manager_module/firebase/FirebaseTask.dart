import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTask {
  static final userRef = FirebaseFirestore.instance.collection("users");

// Add Task to database
  static addTaskDataToFirestore(
      String key, String taskid, Map<String, dynamic> taskAsMap) async {
    final taskRef =
        await userRef.doc(key).collection("tasks").doc(taskid).set(taskAsMap);
  }

  // Update task to firebase
  static updateTaskDataToFirestore(
      String key, String taskid, Map<String, dynamic> taskAsMap) async {
    final taskRef = await userRef
        .doc(key)
        .collection("tasks")
        .doc(taskid)
        .update(taskAsMap);
  }

  //delete data
  static deleteTaskDataToFirestore(String key, String taskid) async {
    await userRef.doc(key).collection("tasks").doc(taskid).delete();
  }
}
