import 'package:flutter/material.dart';


import 'package:stu_pedia/finance_module/screens/home.dart';


import 'package:stu_pedia/finance_module/screens/statistics.dart';


class Bottom extends StatefulWidget {

  const Bottom({Key? key}) : super(key: key);


  @override

  State<Bottom> createState() => _BottomState();

}


class _BottomState extends State<Bottom> {

//   int index_color = 0;


//   List Screen = [Home(), Statistics(), Home(), Statistics()];


//   @override


//   Widget build(BuildContext context) {


//     return Scaffold(


//       body: Screen[index_color],


//       floatingActionButton: FloatingActionButton(


//         onPressed: () {


//           Navigator.of(context)


//               .push(MaterialPageRoute(builder: (context) => Add_Screen()));


//         },


//         child: Icon(Icons.add),


//         backgroundColor: Color(0xff368983),


//       ),


//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


//       bottomNavigationBar: BottomAppBar(


//         shape: CircularNotchedRectangle(),


//         child: Padding(


//           padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),


//           child: Row(


//             mainAxisAlignment: MainAxisAlignment.spaceAround,


//             children: [


//               GestureDetector(


//                 onTap: () {


//                   setState(() {


//                     index_color = 0;


//                   });


//                 },


//                 child: Icon(


//                   Icons.home,


//                   size: 30,


//                   color: index_color == 0 ? Color(0xff368983) : Colors.grey,


//                 ),


//               ),


//               GestureDetector(


//                 onTap: () {


//                   setState(() {


//                     index_color = 1;


//                   });


//                 },


//                 child: Icon(


//                   Icons.bar_chart_outlined,


//                   size: 30,


//                   color: index_color == 1 ? Color(0xff368983) : Colors.grey,


//                 ),


//               ),


//               SizedBox(width: 10),


//               GestureDetector(


//                 onTap: () {


//                   setState(() {


//                     index_color = 2;


//                   });


//                 },


//                 child: Icon(


//                   Icons.account_balance_wallet_outlined,


//                   size: 30,


//                   color: index_color == 2 ? Color(0xff368983) : Colors.grey,


//                 ),


//               ),


//               GestureDetector(


//                 onTap: () {


//                   setState(() {


//                     index_color = 3;


//                   });


//                 },


//                 child: Icon(


//                   Icons.person_outlined,


//                   size: 30,


//                   color: index_color == 3 ? Color(0xff368983) : Colors.grey,


//                 ),


//               ),


//             ],


//           ),


//         ),


//       ),


//     );


//   }


// }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(

          toolbarHeight: 0,

          backgroundColor: Colors.teal,

          title: const Padding(

            padding: EdgeInsets.all(8.0),

            child: Text(

              "",

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

            length: 4,

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

                            child: Text('Statics',

                                style: TextStyle(fontWeight: FontWeight.bold))),

                        Tab(

                            child: Text('Wallet',

                                style: TextStyle(fontWeight: FontWeight.bold))),

                        Tab(

                            child: Text('Setting',

                                style: TextStyle(fontWeight: FontWeight.bold))),

                      ],

                    )

                  ],

                ),

              ),

              body: const TabBarView(

                children: [

                  Home(),

                  Statistics(),

                  Home(),

                  Statistics(),

                ],

              ),

            ),

          ),

        ));

  }

}

