// import 'package:app/size_config.dart';

// import 'package:app/view/Home.dart';

// import 'package:app/view/Notification.dart';

// import 'package:app/view/addTask.dart';

import 'package:flutter/material.dart';

import 'package:stu_pedia/manager_module/view/Home.dart';

import 'package:stu_pedia/manager_module/view/Notification.dart';

class bottomTask extends StatefulWidget {
  const bottomTask({
    Key? key,
  }) : super(key: key);

  @override
  State<bottomTask> createState() => _bottomState();
}

class _bottomState extends State<bottomTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SizedBox(
          height: double.infinity,
          child: DefaultTabController(
            length: 2,
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
                      ],
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Home(),
                  const Notifications(),
                ],
              ),
            ),
          ),
        ));
  }
}
