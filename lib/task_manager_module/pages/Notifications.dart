import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../notificationns_page/notifications_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  void showNotification() async {
    AndroidNotificationDetails androidDetails = const AndroidNotificationDetails(
        "notifications-youtube",
        "YouTube Notifications",
        priority: Priority.max,
        importance: Importance.max
    );

    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notiDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails
    );

    DateTime scheduleDate = DateTime.now().add(Duration(seconds: 5));

    await notificationsPlugin.zonedSchedule(
        0,
        "Sample Notification",
        "This is a notification",
        tz.TZDateTime.from(scheduleDate, tz.local),
        notiDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true,
        payload: "notification-payload"
    );
  }

  void checkForNotification() async {
    NotificationAppLaunchDetails? details = await notificationsPlugin.getNotificationAppLaunchDetails();

    if(details != null) {
      if(details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;

        if(response != null) {
          String? payload = response.payload;
          log("Notification Payload: $payload");
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkForNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.teal,
       title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
       centerTitle: true,
       actions: const [
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Icon(Icons.notifications_on,color: Colors.white,size: 30,),
         )
       ],
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
