import 'package:flutter/material.dart';
import 'package:stu_pedia/finance_module/Screens/add.dart';
import 'package:stu_pedia/finance_module/widgets/financeBottomnavigationbar.dart';
import 'package:stu_pedia/manager_module/screens/AddNewRoutine.dart';

import 'package:stu_pedia/manager_module/view/Home.dart';
import 'package:stu_pedia/notes_module/screens/edit.dart';

import 'package:stu_pedia/notes_module/screens/home.dart';
import 'package:stu_pedia/task_manager_module/newe_entry/EntryPage.dart';
import 'package:stu_pedia/task_manager_module/pages/HomePage.dart';

// ignore: must_be_immutable
class MainBottomNavigation extends StatefulWidget {
  int tabIndeces;
  MainBottomNavigation({required this.tabIndeces, super.key});

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  int index_color = 0;
  List Screen = [HomePage(), Home(), HomeScreen(), const Bottom()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index_color = widget.tabIndeces;
  }

  @override
  Widget build(BuildContext context) {
    // index_color = widget.index;
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(600)),
                      height: 200,
                      child: Card(
                        child: Column(children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30))),
                                            backgroundColor: Colors.green[600]),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const EditScreen(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Notes",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red[600],
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(30))),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddNewRoutine(
                                                        indeces: -1,
                                                        title: "",
                                                        itemList: [],
                                                      )));
                                        },
                                        child: const Text(
                                          "Routine",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30))),
                                            backgroundColor:
                                                Colors.purple[600]),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    NewEntryPage(
                                                  id: "",
                                                  category: "",
                                                  date: "",
                                                  desc: "",
                                                  time: "",
                                                  title: "",
                                                  updateInd: -1,
                                                ),
                                              ));
                                        },
                                        child: const Text(
                                          "Task",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(30))),
                                            backgroundColor: Colors.teal[600]),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Add_Screen()));
                                        },
                                        child: const Text(
                                          "Transaction",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ));
        },
        backgroundColor: const Color(0xff368983),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.alarm_add,
                  size: 30,
                  color: index_color == 1 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.note_add,
                  size: 30,
                  color: index_color == 2 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.currency_rupee,
                  size: 30,
                  color: index_color == 3 ? Color(0xff368983) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
