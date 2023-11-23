import 'package:flutter/material.dart';

titleHeading() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          "Start Time",
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        child: Text(
          "End Time",
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      Expanded(
        flex: 2,
        child: Center(
          child: Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
          ),
        ),
      )
    ],
  );
}
