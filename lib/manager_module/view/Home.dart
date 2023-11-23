import 'package:flutter/material.dart';


import 'package:get/get.dart';


import 'package:stu_pedia/manager_module/data/RoutineData.dart';


import 'package:stu_pedia/manager_module/hiveData/HiveDataRoutine.dart';


import 'package:stu_pedia/manager_module/screens/AddNewRoutine.dart';


import 'package:stu_pedia/manager_module/view/routineCard.dart';


import '../controller/HomeController.dart';


// ignore: must_be_immutable


// ignore: must_be_immutable


class Home extends StatefulWidget {

  Home({

    Key? key,

  }) : super(key: key);


  @override

  State<Home> createState() => _HomeState();

}


class _HomeState extends State<Home> {

  HomeController homeController = Get.put(HomeController());


  @override

  void initState() {

    // TODO: implement initState


    super.initState();


    HiveDataRoutine.fetchRoutineDataFromHive();

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        centerTitle: true,

        title: Text(

          "Routine",

          style: TextStyle(

              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),

        ),

        backgroundColor: Colors.teal,

      ),

      body: SafeArea(

        child: Column(children: [

          Expanded(

            child: SizedBox(

              // height: double,


              child: ListView.builder(

                  itemCount: RoutineData.routineList.length,

                  itemBuilder: (context, index) {

                    return InkWell(

                      onDoubleTap: () async {

                        final resultPage = await Navigator.push(

                            context,

                            MaterialPageRoute(

                                builder: (context) => AddNewRoutine(

                                    keyId: RoutineData.routineList[index].id,

                                    indeces: index,

                                    title: RoutineData

                                        .routineList[index].routineTitle,

                                    itemList: RoutineData

                                        .routineList[index].routineItemList)));


                        if (resultPage != null) {

                          setState(() {

                            HiveDataRoutine.fetchRoutineDataFromHive();

                          });

                        } else {

                          setState(() {

                            HiveDataRoutine.fetchRoutineDataFromHive();

                          });

                        }

                      },

                      child: routineCard(

                          RoutineData.routineList[index].routineTitle,

                          RoutineData.routineList[index].routineItemList),

                    );

                  }),

            ),

          )

        ]),

      ),

    );

  }

}

