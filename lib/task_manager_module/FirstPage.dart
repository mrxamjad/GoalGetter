import 'package:flutter/material.dart';

import 'package:stu_pedia/manager_module/view/Notification.dart';

import 'package:stu_pedia/task_manager_module/pages/HomePage.dart';

import 'package:stu_pedia/task_manager_module/pages/Settings.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Task Manager",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.teal,

                backgroundColor: Colors.teal[100],

                // foregroundColor: Colors.teal,

                toolbarHeight: 50,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),

                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBar(
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                      unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                      unselectedLabelColor: Colors.teal,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(6),
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(20), // Creates border

                          color: Colors.teal),
                      tabs: const [
                        Tab(
                            child: Text(
                          'Home',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Tab(
                            child: Text('Notification',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Tab(
                            child: Text('Settings',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    )
                  ],
                ),
              ),
              body: const TabBarView(
                children: [HomePage(), Notifications(), Settings()],
              ),
            ),
          ),
        ));
  }
}
