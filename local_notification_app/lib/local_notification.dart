import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  int id = 0;
  startup() async {
    InitializationSettings initializationSettingsAndroid =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettingsAndroid,
        onDidReceiveNotificationResponse: (details) {
      print('details::$details');
    });
  }

  Future<void> showNotification() async {
    print('showNotification Start');
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(id++, 'title', 'body', notificationDetails, payload: 'item x');
    print('showNotification finish');
  }
}
