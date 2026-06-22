import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    tz.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await notifications.initialize(settings: settings);
    await notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> scheduleNotification({
    required String id,
    required String title,
    required String body,
    required DateTime scheduleDate
  }) async {
    await notifications.zonedSchedule(
      id: id.hashCode,
      body: body,
      title: title, 
      scheduledDate: tz.TZDateTime.from(scheduleDate, tz.local), 
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'task_channel', 
          'Task_notifications'
        )
      ), 
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}