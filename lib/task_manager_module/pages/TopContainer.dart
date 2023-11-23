import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(bottom: 1),
            child: const Text("Worry Less\n Live Free Minded !",style: TextStyle(fontSize: 25,color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 1),
              child: Text("Welcome To Daily Task",style: TextStyle(fontSize: 17),),
            ),
          ),
          const SizedBox(height: 10,),
          const Text("0",style: TextStyle(fontSize: 25),)
        ],
      ),
    );
//     return Scaffold(
//       // body: Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     Padding(
//       //       padding: const EdgeInsets.all(8.0),
//       //       child: Text("Worry Less\n  Live Free Minded",style: TextStyle(fontSize: 20,color: Colors.teal),),
//       //     ),
//       //     Padding(
//       //       padding: const EdgeInsets.all(8.0),
//       //       child: Text("Welcome To Daily Task",style: TextStyle(color: Colors.teal),),
//       //     ),
//       //     Center(child: Text("0",style: TextStyle(fontSize: 25),)),
//       //   ],
//       //   ),
//       // ),
//     );
  }
}
