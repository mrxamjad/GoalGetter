import 'package:flutter/material.dart';


import 'package:stu_pedia/GlobalData.dart';


import 'package:stu_pedia/MainBottomNavigation.dart';


import 'package:stu_pedia/task_manager_module/common/convertTime.dart';


import 'package:stu_pedia/task_manager_module/firebase/FirebaseTask.dart';


import 'package:stu_pedia/task_manager_module/hiveData/HiveDataTask.dart';


import 'package:stu_pedia/task_manager_module/data/TaskData.dart';


import 'package:stu_pedia/task_manager_module/models/Task.dart';


import 'package:velocity_x/velocity_x.dart';


import 'IconsData.dart';


import 'PannelPage.dart';


// ignore: must_be_immutable


class NewEntryPage extends StatefulWidget {

  String? id;


  String title;


  String desc;


  String category;


  String date;


  String time;


  int updateInd;


  NewEntryPage(

      {this.id,

      required this.title,

      required this.category,

      required this.date,

      required this.desc,

      required this.time,

      required this.updateInd,

      super.key});


  @override

  State<NewEntryPage> createState() => _NewEntryPageState();

}


class _NewEntryPageState extends State<NewEntryPage> {

  TextEditingController _taskController = TextEditingController();


  TextEditingController _desController = TextEditingController();


  late GlobalKey<ScaffoldState> _scaffoldKey;


  String key = "";


  int updateInd = -1;


  String category = "Not Selected";


  String date = "Not Selected";


  String time = "Not Selected";


  @override

  void dispose() {

    super.dispose();


    _desController.dispose();


    _taskController.dispose();

  }


  @override

  void initState() {

    super.initState();


    if (widget.title.isNotEmpty &&

        widget.desc.isNotEmpty &&

        widget.date.isNotEmpty &&

        widget.time.isNotEmpty &&

        widget.category.isNotEmpty) {

      _taskController.text = widget.title;


      _desController.text = widget.desc;


      date = widget.date;


      time = widget.time;


      category = widget.category;


      updateInd = widget.updateInd;

    }


    print("Got new key to updateInd------------->$updateInd");


    if (widget.id.isNotEmptyAndNotNull) {

      key = widget.id!;


      print("Got new key to update------------->$key");

    }


    // _scaffoldKey = GlobalKey<ScaffoldKey>();


    _scaffoldKey = GlobalKey();

  }


  @override

  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () {

        FocusScopeNode currentFocus = FocusScope.of(context);


        if (!currentFocus.hasPrimaryFocus) {

          currentFocus.unfocus();

        }

      },

      child: Scaffold(

        key: _scaffoldKey,

        resizeToAvoidBottomInset: false,

        appBar: AppBar(

          title: const Text("Add New Task"),

          centerTitle: true,

          backgroundColor: Colors.teal.shade200,

          actions: [

            if (key != -1)

              InkWell(

                onDoubleTap: () {

                  HiveDataTask.deleteTaskToHive(updateInd);


                  FirebaseTask.deleteTaskDataToFirestore(GlobalData.key, key);


                  Navigator.of(context).pushReplacement(MaterialPageRoute(

                      builder: (context) => MainBottomNavigation(

                            tabIndeces: 0,

                          )));

                },

                child: Container(

                  margin: const EdgeInsets.all(5),

                  width: 60,

                  height: 30,

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(30),

                    color: Colors.red[400],

                  ),

                  child: const Center(

                      child: Text(

                    "Delete",

                    style: TextStyle(color: Colors.white),

                  )),

                ),

              )

          ],

        ),

        body: SingleChildScrollView(

          scrollDirection: Axis.vertical,

          child: Padding(

            padding: const EdgeInsets.all(5.0),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Pannel(tittle: " Task Name", isRequired: " *"),

                const SizedBox(

                  height: 10,

                ),

                Padding(

                  padding: const EdgeInsets.all(8.0),

                  child: TextField(

                    controller: _taskController,

                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(

                        borderSide: const BorderSide(

                          color: Colors.teal,

                        ),

                        borderRadius: BorderRadius.circular(21),

                      ),

                      focusedBorder: OutlineInputBorder(

                        borderSide: const BorderSide(

                          color: Colors.teal,

                        ),

                        borderRadius: BorderRadius.circular(21),

                      ),

                      hintText: "Add Task Name",

                    ),

                  ),

                ),

                Pannel(tittle: "Descriptions", isRequired: " *"),

                const SizedBox(

                  height: 10,

                ),

                Padding(

                  padding: const EdgeInsets.all(8.0),

                  child: TextField(

                    controller: _desController,

                    maxLength: 100,

                    maxLines: 4,

                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(

                        borderSide: const BorderSide(

                          color: Colors.teal,

                        ),

                        borderRadius: BorderRadius.circular(21),

                      ),

                      focusedBorder: OutlineInputBorder(

                        borderSide: const BorderSide(

                          color: Colors.teal,

                        ),

                        borderRadius: BorderRadius.circular(21),

                      ),

                      hintText: "Add Descriptions......",

                    ),

                  ),

                ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [

                    Pannel(tittle: "Category", isRequired: ""),

                    Container(

                        padding: const EdgeInsets.symmetric(horizontal: 5),

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(20),

                            border: Border.all(color: Colors.teal, width: 1)),

                        child: Text(category))

                  ],

                ),

                const SizedBox(

                  height: 10,

                ),

                SingleChildScrollView(

                  scrollDirection: Axis.horizontal,

                  child: StreamBuilder(

                    builder: (context, value) {

                      return Row(

                        children: [

                          IconsData(

                            name: "Cycling",

                            iconsName: "lib/icons/cycling.png",

                            ipressed: () {

                              setState(() {

                                category = "Cycling";

                              });

                            },

                          ),

                          IconsData(

                            name: "Study",

                            iconsName: "lib/icons/read.png",

                            ipressed: () {

                              setState(() {

                                category = "Study";

                              });

                            },

                          ),

                          IconsData(

                            name: "Hair Cut",

                            iconsName: "lib/icons/hair-cut.png",

                            ipressed: () {

                              setState(() {

                                category = "Hair Cut";

                              });

                            },

                          ),

                          IconsData(

                            name: "Drinkig",

                            iconsName: "lib/icons/glass-of-water.png",

                            ipressed: () {

                              setState(() {

                                category = "Drinkig";

                              });

                            },

                          ),

                          IconsData(

                            name: "Gym",

                            iconsName: "lib/icons/dumbell.png",

                            ipressed: () {

                              setState(() {

                                category = "Gym";

                              });

                            },

                          ),

                          IconsData(

                            name: "Other",

                            iconsName: "lib/icons/dumbell.png",

                            ipressed: () {

                              setState(() {

                                category = "Other";

                              });

                            },

                          ),

                        ],

                      );

                    },

                    stream: null,

                  ),

                ),

                const SizedBox(

                  height: 10,

                ),

                Pannel(tittle: "Remind me on", isRequired: ""),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Column(

                      children: [

                        Container(

                            margin: const EdgeInsets.symmetric(

                                horizontal: 10, vertical: 5),

                            padding: const EdgeInsets.symmetric(horizontal: 10),

                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20),

                                border:

                                    Border.all(color: Colors.teal, width: 1)),

                            child: Text(time)),

                        Center(

                          child: SizedBox(

                            width: 150,

                            height: 50,

                            child: TextButton(

                              style: TextButton.styleFrom(

                                backgroundColor: Colors.teal,

                                shape: StadiumBorder(),

                              ),

                              child: const Text(

                                "Set Time",

                                style: TextStyle(

                                    fontSize: 15, color: Colors.white),

                              ),

                              onPressed: () async {

                                TimeOfDay _time =

                                    TimeOfDay(hour: 0, minute: 00);


                                final TimeOfDay? picked = await showTimePicker(

                                  context: context,

                                  initialTime: _time,

                                );


                                if (picked != null && picked != _time) {

                                  setState(() {

                                    // time = picked.toString();


                                    time =

                                        "${convertTime(picked.hour.toString())}: ${convertTime(picked.minute.toString())}";


                                    // _clicked = true;

                                  });

                                }

                              },

                            ),

                          ),

                        ),

                      ],

                    ),

                    Column(

                      children: [

                        Container(

                            margin: const EdgeInsets.symmetric(

                                horizontal: 10, vertical: 5),

                            padding: const EdgeInsets.symmetric(horizontal: 10),

                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20),

                                border:

                                    Border.all(color: Colors.teal, width: 1)),

                            child: Text(date.substring(0, 10))),

                        Center(

                          child: SizedBox(

                            width: 150,

                            height: 50,

                            child: TextButton(

                              style: TextButton.styleFrom(

                                backgroundColor: Colors.teal,

                                shape: StadiumBorder(),

                              ),

                              child: const Text(

                                "Set Date",

                                style: TextStyle(

                                    fontSize: 15, color: Colors.white),

                              ),

                              onPressed: () async {

                                final result = await showDatePicker(

                                  context: context,

                                  initialDate: DateTime.now(),

                                  firstDate: DateTime(1947),

                                  lastDate: DateTime(2090),

                                );


                                if (result != null) {

                                  setState(() {

                                    date = result.toString();

                                  });

                                }

                              },

                            ),

                          ),

                        ),

                      ],

                    ),

                  ],

                ),

                SizedBox(

                  width: double.infinity,

                  child: ElevatedButton(

                      style: ElevatedButton.styleFrom(

                          backgroundColor: Colors.teal),

                      onPressed: () {

                        Task task = Task(

                            indeces: updateInd,

                            id: "",

                            title: _taskController.text,

                            desc: _desController.text,

                            category: category,

                            date: date,

                            time: time);


                        if (updateInd == -1) {

                          task.id = DateTime.now().toString();


                          key = task.id!;


                          TaskData.addTask(_taskController.text,

                              _desController.text, category, date, time);


                          HiveDataTask.addNotesDataToHive(task.toMap());


                          FirebaseTask.addTaskDataToFirestore(

                              GlobalData.key, key, task.toMap());


                          context.showToast(

                              msg: "Task added Successfully",

                              bgColor: Colors.green,

                              textColor: Colors.white,

                              position: VxToastPosition.top);

                        } else {

                          // TaskData.updateTask(updateInd, _taskController.text,


                          //     _desController.text, category, date, time);


                          task.id = key;


                          print("update in-------$updateInd");


                          final hiveTask = HiveDataTask.updateTaskToHive(

                              updateInd, task.toMap());


                          //  hiveTask.whenComplete(() => hiveTask.toString())


                          //update date toTask


                          print("Key on update-------->$key");


                          FirebaseTask.updateTaskDataToFirestore(

                              GlobalData.key, key, task.toMap());


                          context.showToast(

                              msg: "Task updated Successfully",

                              bgColor: Colors.green,

                              textColor: Colors.white,

                              position: VxToastPosition.top);

                        }


                        Navigator.of(context).pushReplacement(MaterialPageRoute(

                            builder: (context) => MainBottomNavigation(

                                  tabIndeces: 0,

                                )));


                        setState(() {});


                        // Navigator.of(context).pop();

                      },

                      child: Text(

                        key.isEmptyOrNull ? "Add Task" : "Update Task",

                        style: TextStyle(color: Colors.white),

                      )),

                )

              ],

            ),

          ),

        ),

      ),

    );

  }

}

