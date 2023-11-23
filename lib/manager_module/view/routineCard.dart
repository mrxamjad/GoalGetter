import 'package:flutter/material.dart';
import 'package:stu_pedia/manager_module/data/RoutinItem.dart';
import 'package:stu_pedia/manager_module/view/routineTime.dart';
import 'package:stu_pedia/manager_module/view/titleHeading.dart';

Container routineCard(String title, List<RoutineItemData> itemList) {
  int totalItem = itemList.length;
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal, width: 1)),
    child: Column(children: [
      Text(
        title,
        style: const TextStyle(
            color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const Divider(height: 1, color: Colors.black, thickness: 0.2),
      titleHeading(),
      SizedBox(
        height: totalItem * 25,
        child: ListView.builder(
            itemCount: totalItem,
            itemBuilder: (context, index) {
              return routineTime(itemList[index].startTime,
                  itemList[index].endTime, itemList[index].description);
            }),
      ),
      Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            child: Icon(Icons.add),
          ))
    ]),
  );
}
