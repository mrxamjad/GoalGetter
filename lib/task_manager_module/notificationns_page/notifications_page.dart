import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stu_pedia/manager_module/view/Notification.dart';
import 'package:timezone/data/latest_10y.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeTimeZones();

  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true);
  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

  bool? initialized = await notificationsPlugin.initialize(
      initializationSettings, onDidReceiveNotificationResponse: (response) {
    log(response.payload.toString());
  });

  log("Notifications: $initialized");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Notifications(),
    );
  }
}
