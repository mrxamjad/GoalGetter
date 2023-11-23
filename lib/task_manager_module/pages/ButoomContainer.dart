import 'package:flutter/material.dart';

import 'Item_Delete.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // return GridView(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2
    //     ),
    //   children: [
    //     Container(
    //       width: 100,
    //       height: 100,
    //       color: Colors.teal,
    //     )
    //   ],
    // );
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("In Progress",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               width: 400,
               height: 150,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(21),
                 color: Colors.teal,
               ),child: Center(child: Text("You don't have any task yet!!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal,color: Colors.white),)),
             ),
           ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(21),
                      ),child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDeletes(),));
                          },
                          child: Image.asset("lib/icons/cycling.png",scale:10,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            color: Colors.teal.shade200,
                          ),child: Center(child: Text("Cycling",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                        )
                      ],
                    ),
                    ),
                  ),
                ],
              ),



          ],
        );
  }
}
