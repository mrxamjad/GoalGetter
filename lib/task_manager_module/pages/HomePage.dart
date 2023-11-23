import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:flutter/material.dart';


import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'package:stu_pedia/GlobalData.dart';


import 'package:stu_pedia/services/NotificationService.dart';


import 'package:stu_pedia/task_manager_module/hiveData/HiveDataTask.dart';


import 'package:stu_pedia/task_manager_module/data/TaskData.dart';


import 'package:stu_pedia/task_manager_module/models/Task.dart';


import 'package:stu_pedia/task_manager_module/newe_entry/EntryPage.dart';


import 'package:stu_pedia/task_manager_module/pages/taskItem.dart';


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =

    FlutterLocalNotificationsPlugin();


class HomePage extends StatefulWidget {

  const HomePage({super.key});


  @override

  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {

  @override

  void initState() {

    // TODO: implement initState


    super.initState();


    HiveDataTask.fetchTaskDataFromHive();


    NotificationService.initialize(flutterLocalNotificationsPlugin);

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(

          backgroundColor: Colors.teal,

          actions: [

            IconButton(

                onPressed: () {

                  print("Notification call---------");


                  NotificationService.showBigNotification(

                      title: "This is title",

                      body: "body of the message",

                      fln: flutterLocalNotificationsPlugin);

                },

                icon: Icon(Icons.notification_add))

          ],

          title: const Padding(

            padding: EdgeInsets.all(8.0),

            child: Text(

              "Task Manager",

              style: TextStyle(

                  fontSize: 20,

                  fontWeight: FontWeight.bold,

                  color: Colors.white),

            ),

          ),

          centerTitle: true,

        ),

        body: FutureBuilder(

          future: FirebaseFirestore.instance

              .collection("users")

              .doc(GlobalData.key)

              .collection("tasks")

              .get(),

          builder: (context, snap) {

            if (snap.hasData) {

              final data = snap.data!;


              final List<Task> taskList = data.docs.map((e) {

                return Task.fromMap(e.data());

              }).toList();


              TaskData.taskList = taskList;


              // setState(() {});


              print("gtting from online-------");


              print(taskList.toList().toString());

            }


            return ListView.builder(

                itemCount: TaskData.taskList.length,

                itemBuilder: (context, index) {

                  return taskItem(

                      TaskData.taskList[index].title!,

                      TaskData.taskList[index].desc!,

                      TaskData.taskList[index].date!,

                      TaskData.taskList[index].time!,

                      TaskData.taskList[index].category!, () {

                    Navigator.of(context).pushReplacement(MaterialPageRoute(

                        builder: (context) => NewEntryPage(

                              id: TaskData.taskList[index].id!,

                              title: TaskData.taskList[index].title!,

                              category: TaskData.taskList[index].category!,

                              date: TaskData.taskList[index].date!,

                              desc: TaskData.taskList[index].desc!,

                              time: TaskData.taskList[index].time!,

                              updateInd: TaskData.taskList[index].indeces!,

                            )));

                  });

                });

          },

        ));

  }

}

