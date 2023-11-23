import 'package:flutter/material.dart';
import 'package:stu_pedia/MainBottomNavigation.dart';
import 'package:stu_pedia/manager_module/data/RoutinItem.dart';
import 'package:stu_pedia/manager_module/data/RoutineData.dart';
import 'package:stu_pedia/manager_module/hiveData/HiveDataRoutine.dart';
import 'package:stu_pedia/manager_module/view/routineTime.dart';
import 'package:stu_pedia/manager_module/view/titleHeading.dart';
import 'package:stu_pedia/task_manager_module/common/convertTime.dart';

// ignore: must_be_immutable
class AddNewRoutine extends StatefulWidget {
  String title;
  int? indeces;
  int? keyId;
  List<RoutineItemData> itemList;
  AddNewRoutine(
      {this.indeces,
      this.keyId,
      required this.title,
      required this.itemList,
      super.key});

  @override
  State<AddNewRoutine> createState() => _AddNewRoutineState();
}

class _AddNewRoutineState extends State<AddNewRoutine> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _itemController = TextEditingController();
  List<RoutineItemData> itemList = [];
  String startTime = "", endTime = "";
  int indeces = -1;
  int key = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList = widget.itemList;
    _titleController.text = widget.title;

    if (widget.indeces != null) {
      indeces = widget.indeces!;
    }
    if (widget.keyId != null) {
      key = widget.keyId!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          actions: [
            if (key != -1)
              InkWell(
                onDoubleTap: () {
                  HiveDataRoutine.deleteRoutineToHive(key);

                  Navigator.of(context).pop();
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
        body: Column(children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.teal, width: 1)),
            child: Column(children: [
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: TextField(
                  style: TextStyle(fontSize: 16),
                  controller: _titleController,
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
                    hintText: "Add Routine Title",
                  ),
                ),
              ),
              const Divider(height: 1, color: Colors.black, thickness: 0.2),
              SizedBox(
                height: 15,
              ),
              if (itemList.isNotEmpty) titleHeading(),
              SizedBox(
                height: itemList.length * 25,
                child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return routineTime(itemList[index].startTime,
                          itemList[index].endTime, itemList[index].description);
                    }),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                        height: 30,
                        child: ElevatedButton(
                            onPressed: () async {
                              TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
                              final TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: _time,
                              );
                              if (picked != null && picked != _time) {
                                setState(() {
                                  // time = picked.toString();
                                  startTime =
                                      "${convertTime(picked.hour.toString())}: ${convertTime(picked.minute.toString())}";
                                  // _clicked = true;
                                });
                              }
                            },
                            child: Text(
                                startTime.isEmpty ? "set time" : startTime))),
                  ),
                  SizedBox(
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () async {
                            TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: _time,
                            );
                            if (picked != null && picked != _time) {
                              setState(() {
                                // time = picked.toString();
                                endTime =
                                    "${convertTime(picked.hour.toString())}: ${convertTime(picked.minute.toString())}";
                                // _clicked = true;
                              });
                            }
                          },
                          child: Text(endTime.isEmpty ? "set date" : endTime))),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          style: const TextStyle(fontSize: 14),
                          controller: _itemController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.teal,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.teal,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: "Description...",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      if (startTime.isNotEmpty &&
                          endTime.isNotEmpty &&
                          _itemController.text.isNotEmpty) {
                        itemList.add(RoutineItemData(
                            startTime: startTime,
                            endTime: endTime,
                            description: _itemController.text));

                        setState(() {
                          startTime = "";
                          endTime = "";
                          _itemController.clear();
                        });
                      }
                    },
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ))
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  RoutineData routineData = RoutineData(
                      routineTitle: _titleController.text,
                      routineItemList: itemList);
                  if (key == -1) {
                    if (_titleController.text.isNotEmpty &&
                        itemList.isNotEmpty) {
                      HiveDataRoutine.addRoutineDataToHive(routineData.toMap());
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MainBottomNavigation(
                                tabIndeces: 1,
                              )));
                    }
                  } else {
                    if (_titleController.text.isNotEmpty &&
                        itemList.isNotEmpty) {
                      HiveDataRoutine.updateRoutineToHive(
                          key, routineData.toMap());
                    }
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  key == -1 ? "Add Routine" : "Update Task",
                  style: const TextStyle(color: Colors.white),
                )),
          )
        ]),
      ),
    );
  }
}
