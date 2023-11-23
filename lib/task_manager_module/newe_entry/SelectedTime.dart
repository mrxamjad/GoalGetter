
import 'package:flutter/material.dart';

import '../common/convertTime.dart';

class SelectedTime extends StatefulWidget {
  const SelectedTime({super.key});

  @override
  State<SelectedTime> createState() => _SelectedTimeState();
}
TimeOfDay _time = TimeOfDay(hour: 0, minute:00);
bool _clicked = false;




class _SelectedTimeState extends State<SelectedTime> {
  Future<TimeOfDay> _selectedTime()async{
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if(picked != null && picked != _time){
      setState(() {
        _time = picked;
        _clicked = true;
      });

    }
    return picked!;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 150,
        child:  Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: TextButton(
              style:TextButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: const StadiumBorder(),
              ),
              onPressed: (){
                _selectedTime();
              },
              child: Center(
                child: Text(
                  _clicked == false?
                  "Select Time" :
                  "${convertTime(_time.hour.toString())}: ${convertTime(_time.minute.toString())}",
                  style: const TextStyle(fontSize: 15,color: Colors.white),),
              )
          ),
        ),
      ),
    );
  }
}