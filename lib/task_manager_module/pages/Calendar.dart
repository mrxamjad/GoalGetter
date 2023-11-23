import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 6,
       blackoutDates: const [

       ],
       // dataSource: MeetingDataSource(getAppointment()),
      ),
    );

  }

}
List<Appointment> getAppointment(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year,today.month,today.year,23,10,15);
  final DateTime endTime = startTime.add(Duration(hours: 2));
  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
    subject: "Meetings",
    color: Colors.teal,
  ));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  // MeetingDataSource(List<Appointment> appointment);
  MettingDtatSource(List<Appointment> source){
    appointments = source;
  }
}

// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
// import 'package:flutter_clean_calendar/clean_calendar_event.dart';
//
//
//
// class CalendarApp extends StatefulWidget {
//   @override
//   State<CalendarApp> createState() => _CalendarAppState();
// }
//
// class _CalendarAppState extends State<CalendarApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Clean Calendar Demo',
//       home: CalendarScreen(),
//     );
//   }
// }
//
// class CalendarScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _CalendarScreenState();
//   }
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   final Map<DateTime, List<CleanCalendarEvent>> _events = {
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
//       CleanCalendarEvent('Event A',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day, 10, 0),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day, 12, 0),
//           description: 'A special event',
//           color: Colors.blue),
//     ],
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
//     [
//       CleanCalendarEvent('Event B',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 10, 0),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 12, 0),
//           color: Colors.orange),
//       CleanCalendarEvent('Event C',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 14, 30),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 17, 0),
//           color: Colors.pink),
//     ],
//     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 3):
//     [
//       CleanCalendarEvent('Event B',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 10, 0),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 12, 0),
//           color: Colors.orange),
//       CleanCalendarEvent('Event C',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 14, 30),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 17, 0),
//           color: Colors.pink),
//       CleanCalendarEvent('Event D',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 14, 30),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 17, 0),
//           color: Colors.amber),
//       CleanCalendarEvent('Event E',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 14, 30),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 17, 0),
//           color: Colors.deepOrange),
//       CleanCalendarEvent('Event F',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 14, 30),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 17, 0),
//           color: Colors.green),
//       CleanCalendarEvent('Event G',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 14, 30),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 17, 0),
//           color: Colors.indigo),
//       CleanCalendarEvent('Event H',
//           startTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 14, 30),
//           endTime: DateTime(DateTime.now().year, DateTime.now().month,
//               DateTime.now().day + 2, 17, 0),
//           color: Colors.brown),
//     ],
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     // Force selection of today on first load, so that the list of today's events gets shown.
//     _handleNewDate(DateTime(
//         DateTime.now().year, DateTime.now().month, DateTime.now().day));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Calendar(
//           startOnMonday: true,
//           weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
//           events: _events,
//           isExpandable: true,
//           eventDoneColor: Colors.green,
//           selectedColor: Colors.pink,
//           todayColor: Colors.blue,
//           eventColor: Colors.grey,
//           locale: 'de_DE',
//           todayButtonText: 'Heute',
//           isExpanded: true,
//           expandableDateFormat: 'EEEE, dd. MMMM yyyy',
//           dayOfWeekStyle: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
//         ),
//       ),
//     );
//   }
//
//   void _handleNewDate(date) {
//     print('Date selected: $date');
//   }
// }