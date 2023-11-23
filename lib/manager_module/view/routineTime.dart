import 'package:flutter/material.dart';

Column routineTime(String start, String end, String desc) {
  return Column(
    children: [
      const Divider(
        color: Colors.black,
        thickness: 0.1,
        height: 1,
      ),
      Container(
        padding: const EdgeInsets.only(top: 5, bottom: 2, left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                end,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  desc,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
