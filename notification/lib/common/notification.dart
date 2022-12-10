import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';

Future<void> createWaktuSholatNotification(
    int id, int hour, int minute, String title, String body) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: 'scheduled_channel',
      title: title,
      body: body,
      notificationLayout: NotificationLayout.Default,
    ),
    schedule: NotificationCalendar(
      repeats: true,
      hour: hour,
      minute: minute,
      second: 0,
      millisecond: 0,
    ),
  );
}

Future<void> cancelWaktuSholatNotification(int id) async {
  await AwesomeNotifications().cancelSchedule(id);
  if (kDebugMode) {
    print('Scheduled canceled');
  }
}
