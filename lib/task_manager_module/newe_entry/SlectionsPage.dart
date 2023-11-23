import 'dart:core';
import 'package:flutter/material.dart';

class IntervalSlections extends StatefulWidget {
  const IntervalSlections({super.key});

  @override
  State<IntervalSlections> createState() => _IntervalSlectionsState();
}

final _intervals = [
  6,
  8,
  12,
  24,
];
var _selected = 0;

class _IntervalSlectionsState extends State<IntervalSlections> {
  DateTime? _date;

  _dateTime() {
    if (_date == null) {
      return "Select Date";
    } else {
      return '${_date?.day} - ${_date?.month} -${_date?.year}';
    }
  }
  // bool _clicked = false;
  // DateTime _date = DateTime(DateTime.monthsPerYear);
  //
  // Future<DateTime> ShowDatePicker() async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1947),
  //     lastDate: DateTime(2090),
  //   );
  //   if (picked != null && picked != DateTime.now()) {
  //     setState(() {
  //       _date = picked;
  //       _clicked = true;
  //     });
  //   }
  //   return picked!;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Remainder Every Day",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          const SizedBox(
            width: 13,
          ),
          // DropdownButton(
          // itemHeight: 8,
          // hint: _selected == 0?
          Container(
            width: 120,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: Colors.teal,
            ),
            child: Center(
                child: InkWell(
                    onTap: () async {
                      final result = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1947),
                        lastDate: DateTime(2090),
                      );
                      if (result != null) {
                        setState(() {
                          _date = result;
                        });
                      }
                    },
                    child: Text(
                      _dateTime(),
                      // "${convertTime(_time.hour.toString())}: ${convertTime(_time.minute.toString())}",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ))),
          ),
          // : null,
          // elevation: 0,
          //   value: _selected == 0? null :_selected,
          //   items: _intervals.map((int value) {
          //     return DropdownMenuItem<int>(
          //       value: value,
          //       child: Text(value.toString(),
          //           style: TextStyle(color: Colors.teal)
          //       ),
          //     );
          //   }).toList(),
          //   onChanged: (newVal) {
          //     setState(() {
          //       _selected = newVal!;
          //     });
          //   },
          // ),
          // SizedBox(width: 40,),
          Text(
            _selected == 1 ? "Hours" : "Hours",
            style: TextStyle(fontSize: 20, color: Colors.teal.shade700),
          ),
        ],
      ),
    );
  }
}
