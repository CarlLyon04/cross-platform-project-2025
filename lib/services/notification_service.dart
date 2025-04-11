import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class NotificationService {
  // Singleton instance of the notifications plugin
  static final FlutterLocalNotificationsPlugin notificationPlugin =
      FlutterLocalNotificationsPlugin();

  // Initializes notification settings and permissions
  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitialize =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const InitializationSettings initializeSettings = InitializationSettings(
      android: androidInitialize,
    );

    await notificationPlugin.initialize(initializeSettings);

    // Request notification permission explicitly for Android 13+
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        final status = await Permission.notification.request();
        if (status != PermissionStatus.granted) {
          print('Notification permission was not granted');
        }
      }
    }
  }

  // Displays a local notification with title and body
  static Future<void> displayNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'figurine_channel', // Unique channel ID
          'Figurine Notifications', // Channel name
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    // Show the notification
    await notificationPlugin.show(0, title, body, notificationDetails);
  }
}