import 'package:flutter/material.dart';

InkWell taskItem(String title, String desc, String date, String time,
    String category, VoidCallback onDoublePress) {
  return InkWell(
    onDoubleTap: () {
      onDoublePress();
    },
    child: Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.teal),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(desc),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Deu on:",
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "${date.substring(0, 10)}  $time",
                        style: const TextStyle(
                            color: Colors.teal,
                            // fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.teal, width: 1)),
                      child: Text(
                        category,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
