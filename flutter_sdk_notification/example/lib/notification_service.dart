import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_sdk_notification/flutter_sdk_notification.dart';

@pragma("vm:entry-point")
class NotificationService {
  // Initialize FirebaseMessingService to listen Messages
  static firebaseMessagingInitialize() {
    onBackgroundMessage();
    onMessage();

    if (Platform.isIOS) {
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        FlutterSdkNotification.handleNotification(message.data);
      });
    }
  }

  // this used to receive message when app in background
  @pragma("vm:entry-point")
  static Future<void> backgroundHandler(RemoteMessage message) async {
    // Icon should be Drawable source
    if (Platform.isAndroid) {
      FlutterSdkNotification.showNotification(message.data, "sample_app_logo");
    }
  }

  static void onBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }

  static Future<void> getFCMToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCM Token - $fcmToken");
  }

  static onMessage() {
    FirebaseMessaging.onMessage.listen((message) async {
      if (Platform.isAndroid) {
        // Icon should be Drawable source
        FlutterSdkNotification.showNotification(message.data, "sample_app_logo");
      }
    });
  }
}
