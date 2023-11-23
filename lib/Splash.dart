import 'dart:async';


// import 'package:app/bottom.dart';


import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';


import 'package:stu_pedia/GlobalData.dart';


import 'package:stu_pedia/LoginScreen.dart';


import 'package:stu_pedia/MainBottomNavigation.dart';


import 'package:velocity_x/velocity_x.dart';


class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);


  @override

  State<Splash> createState() => _SplashState();

}


class _SplashState extends State<Splash> {

  // void finish() {


  //   Navigator.of(context)


  //       .push(MaterialPageRoute(builder: (context) => bottomTask()));


  // }


  String key = "";


  getKey() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();


    key = preferences.getString("key") ?? "";


    GlobalData.key = key;


    setState(() {});

  }


  void initState() {

    super.initState();


    getKey();


    Timer(

        const Duration(seconds: 3),

        () => Navigator.pushReplacement(

            context,

            MaterialPageRoute(

                builder: (context) => key.isEmptyOrNull

                    ? LoginScreen()

                    : MainBottomNavigation(tabIndeces: 0))));

  }


  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(

              'Time is Precious',

              style: TextStyle(

                fontSize: 27,

                fontWeight: FontWeight.bold,

                color: Colors.black87,

              ),

            ),

            const SizedBox(

              height: 10,

            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Image.asset(

                  'lib/icons/tasks.png',

                  scale: 2,

                  fit: BoxFit.cover,

                ),

              ],

            ),

          ],

        ),

      ),

    );

  }

}

