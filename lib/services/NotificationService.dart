import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  //initialize notification

  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings("mipmap/ic_launcher");

    var initializationSetting =
        InitializationSettings(android: androidInitialize);

    await flutterLocalNotificationsPlugin.initialize(initializationSetting);
  }

  // send notification method
  static Future showBigNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("task_notification", "channelName",
            playSound: true,
            importance: Importance.max,
            // sound: RawResourceAndroidNotificationSound("notification"),
            priority: Priority.high);
    var notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await fln.show(id, title, body, notificationDetails);
  }
}
