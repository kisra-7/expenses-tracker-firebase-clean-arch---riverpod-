import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> onTap(NotificationResponse details) async {}

  static Future<void> init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
    final androidImpl = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidImpl?.requestNotificationsPermission();

    await androidImpl?.requestExactAlarmsPermission();
  }

  static void showBasicNotification() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'notification channel',
        importance: Importance.max,
        priority: Priority.max,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: 'daily reminder',
      body: 'Any expenses to add ?',
      notificationDetails: details,
    );
  }

  static void showRepeatedNotification() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 2',
        'Reapeated notification channel',
        importance: Importance.max,
        channelDescription: 'repeating discreption',
        priority: Priority.max,
      ),
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id: 1,
      title: 'daily reminder',
      body: 'Any expenses to add ?',
      notificationDetails: details,
      repeatInterval: RepeatInterval.everyMinute,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
